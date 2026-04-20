# Beast Mastery – Wolf damage detection tick.
# Runs as each ms_bm_wolf, at the wolf's position.
# Detects hurt/dying mobs near the wolf via proximity.
# If the owner's melee cooldown (ms.bm_mcd) is active, skip to avoid
# false triggers from the player's own attacks.
#
# NOTE: Unlike arrow-hit advancements (which fire during entity tick and
# always see HurtTime=10), this function runs from #minecraft:tick BEFORE
# entity ticking. So if the victim entity-ticked after the wolf in the
# previous game tick, HurtTime has already decremented to 9. We check both.

# --- Skip if owner recently dealt damage (cooldown active) ---
execute on owner if score @s ms.bm_mcd matches 1.. run return 0

# Reset temp
scoreboard players set @s ms.bm_temp 0

# --- Hit detection: hurt mob within range (check both 10 and 9 for entity tick order) ---
execute if entity @e[type=!minecraft:player,type=!minecraft:wolf,nbt={HurtTime:10s},distance=..10,limit=1] run scoreboard players set @s ms.bm_temp 1
execute if score @s ms.bm_temp matches 0 if entity @e[type=!minecraft:player,type=!minecraft:wolf,nbt={HurtTime:9s},distance=..10,limit=1] run scoreboard players set @s ms.bm_temp 1

# --- Kill detection: dying mob within range (same tick-order variance) ---
execute if score @s ms.bm_temp matches 0 if entity @e[type=!minecraft:player,type=!minecraft:wolf,nbt={DeathTime:1s},distance=..10,limit=1] run scoreboard players set @s ms.bm_temp 1
execute if score @s ms.bm_temp matches 0 if entity @e[type=!minecraft:player,type=!minecraft:wolf,nbt={DeathTime:2s},distance=..10,limit=1] run scoreboard players set @s ms.bm_temp 1

# --- Heal the Ranger ---
execute if score @s ms.bm_temp matches 1 on owner if entity @s[scores={ms.class=3,ms.t5_perk=3}] run function minesouls:perk/ranger/t5/beast_mastery_heal
