# Beast Mastery – Ranger Tier 5 Perk 3 (per-player tick)
# Wolves tamed by the Ranger have permanent Strength II.
# Any damage dealt by the wolves heals 2 HP to the Ranger.
# The Ranger will always have at least 1 tamed wolf.

# --- Count wolves owned by THIS player ---
# Uses ms_bm_check temp tag + "on owner" to verify wolf ownership
scoreboard players set @s ms.bm_count 0
tag @s add ms_bm_check
execute as @e[type=minecraft:wolf,tag=ms_bm_wolf,distance=..50] on owner if entity @s[tag=ms_bm_check] run scoreboard players add @s ms.bm_count 1

# --- Summon a wolf if this player has none ---
execute if score @s ms.bm_count matches 0 run function minesouls:perk/ranger/t5/beast_mastery_summon

# --- Buff only this player's wolves with Strength II ---
# "at @s" positions at the wolf, "on owner" checks ownership, then targets the wolf by proximity
# Strength II (amplifier 1) for 2 seconds, refreshed every tick, hidden particles
execute as @e[type=minecraft:wolf,tag=ms_bm_wolf,distance=..50] at @s on owner if entity @s[tag=ms_bm_check] run effect give @e[type=minecraft:wolf,distance=..0.1,limit=1] minecraft:strength 2 1 true
execute as @e[type=minecraft:wolf,tag=ms_bm_wolf,distance=..50] at @s on owner if entity @s[tag=ms_bm_check] run effect give @e[type=minecraft:wolf,distance=..0.1,limit=1] minecraft:resistance 2 1 true

tag @s remove ms_bm_check
