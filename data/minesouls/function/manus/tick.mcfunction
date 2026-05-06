# Per-entity tick for Manus, Father of the Abyss.
# Called from the global tick as:
#   execute as @e[tag=ms_manus] at @s run function minesouls:manus/tick

# Keep Manus permanently silent every tick
data merge entity @s {Silent:1b}

# Prevent Manus from burrowing: keep the dig_cooldown brain memory present.
# When this memory is absent the Warden AI immediately triggers its dig-away sequence.
# Refreshing it each tick (ttl:200 = 10 s) means it never expires.
data modify entity @s Brain.memories."minecraft:dig_cooldown" set value {value:{},ttl:200}

# Force Manus to chase and attack: write the nearest player's UUID directly into the
# Warden's attack_target brain memory every tick. Without this, removing the invalid
# angerLevel tag leaves the Warden with no target and it stands still.
tag @p[distance=..64] add ms_manus_target_temp
execute if entity @a[tag=ms_manus_target_temp] run data modify entity @s Brain.memories."minecraft:attack_target" set value {value:[I;0,0,0,0],ttl:100}
execute if entity @a[tag=ms_manus_target_temp] run data modify entity @s Brain.memories."minecraft:attack_target".value.value set from entity @a[tag=ms_manus_target_temp,limit=1] UUID
tag @a remove ms_manus_target_temp

# Sync boss health bar value and update the visible-player list
execute store result bossbar minesouls:manus value run data get entity @s Health 1
bossbar set minesouls:manus players @a[distance=..80]

# Ambient dark-magic particles (soul fire wisps + void ink)
particle minecraft:soul_fire_flame ~ ~1.5 ~ 0.7 1.5 0.7 0.05 8 normal
particle minecraft:squid_ink ~ ~1.5 ~ 0.4 1.0 0.4 0.03 5 normal

# Despawn when no player is within 50 blocks (calls despawn.mcfunction then exits)
execute unless entity @a[distance=..50,limit=1] run function minesouls:manus/despawn
execute unless entity @a[distance=..50,limit=1] run return 0

# Phase 2 transition check (only while still in Phase 1)
execute if score @s ms.manus_phase matches 1 run function minesouls:manus/phase2_check

# Decrement attack-fire timers
scoreboard players remove @s ms.manus_skull_timer 1
scoreboard players remove @s ms.manus_lightning_timer 1

# Decrement the Darkwraith re-summon timer in Phase 2
execute if score @s ms.manus_phase matches 2 run scoreboard players remove @s ms.manus_dw_timer 1

# Fire a wither skull in 4 directions every 30 ticks (alternates cardinal/diagonal)
execute if score @s ms.manus_skull_timer matches ..0 run function minesouls:manus/skull_fire

# Strike random positions near Manus with lightning every 60 ticks (3 seconds)
execute if score @s ms.manus_lightning_timer matches ..0 run function minesouls:manus/lightning_fire

# Re-summon 4 Darkwraiths every 20 seconds (400 ticks) while in Phase 2
execute if score @s ms.manus_phase matches 2 if score @s ms.manus_dw_timer matches ..0 run function minesouls:manus/summon_darkwraiths
