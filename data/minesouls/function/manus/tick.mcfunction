# Per-entity tick for Manus, Father of the Abyss.
# Called from the global tick as:
#   execute as @e[tag=ms_manus] at @s run function minesouls:manus/tick

# Keep Manus permanently silent and at maximum anger every tick
data merge entity @s {Silent:1b,angerLevel:150}

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
scoreboard players remove @s ms.manus_wave_timer 1

# Decrement the Darkwraith re-summon timer in Phase 2
execute if score @s ms.manus_phase matches 2 run scoreboard players remove @s ms.manus_dw_timer 1

# Fire a wither skull at a random nearby player every 10 ticks
execute if score @s ms.manus_skull_timer matches ..0 run function minesouls:manus/skull_fire

# Fire the slow dark-magic wave at a random nearby player every 60 ticks (3 seconds)
execute if score @s ms.manus_wave_timer matches ..0 run function minesouls:manus/wave_fire

# Re-summon 4 Darkwraiths every 20 seconds (400 ticks) while in Phase 2
execute if score @s ms.manus_phase matches 2 if score @s ms.manus_dw_timer matches ..0 run function minesouls:manus/summon_darkwraiths
