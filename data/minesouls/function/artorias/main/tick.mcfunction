# Knight Artorias – Per-entity tick
# Called from the global tick as:
#   execute as @e[type=vindicator,tag=ms_artorias] at @s run function minesouls:artorias/main/tick
# Runs as the vindicator (base entity) at its position.

# Keep base entity invisible and AI-disabled every tick
data merge entity @s {Silent:1b,NoAI:1b}
effect give @s minecraft:invisibility 2 0 true

# Sync bossbar health value
execute store result bossbar minesouls:artorias value run data get entity @s Health 1
bossbar set minesouls:artorias players @a[distance=..80]

# Ambient dark particles (squid ink — black wisps around the figure)
particle minecraft:squid_ink ~ ~1 ~ 0.4 1.0 0.4 0.02 8 normal

# Despawn when no player is within 60 blocks
execute unless entity @a[distance=..60,limit=1] run function minesouls:artorias/despawn
execute unless entity @a[distance=..60,limit=1] run return 0

# Armor stand failsafe: re-summon visual if it went missing
execute unless entity @e[type=armor_stand,tag=ms_artorias_stand,limit=1] run function minesouls:artorias/init_stand

# Sync armor stand position and rotation to base entity
function minesouls:artorias/visual/update

# Phase 2 health check (only while in phase 1 and not already transitioning)
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_state matches 0..11 run function minesouls:artorias/phase2/check

# Phase 2 proximity aura (only in phase 2)
execute if score @s ms.arta_phase matches 2 run function minesouls:artorias/aura_tick

# Decrement global attack cooldown
execute if score @s ms.arta_attack_cd matches 1.. run scoreboard players remove @s ms.arta_attack_cd 1

# Run exactly one state handler then return (dispatch uses return run to prevent double execution)
function minesouls:artorias/main/dispatch

# Increment per-state timer after state logic runs
scoreboard players add @s ms.arta_timer 1
