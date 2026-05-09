# Knight Artorias – Somersault Slam: Impact (state 6)
# Teleports boss to the pre-pinned target position, triggers shockwave, transitions.
# Runs as the base entity at its position.

# Apply impact pose
function minesouls:artorias/visual/pose_slam_impact

# Tick 1: slam down to target marker position
execute if score @s ms.arta_timer matches 1 if entity @e[tag=ms_arta_slam_target,limit=1] run execute at @e[tag=ms_arta_slam_target,limit=1] run teleport @s ~ ~ ~
execute if score @s ms.arta_timer matches 1 run kill @e[tag=ms_arta_slam_target]

# Impact effects on first tick
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.generic.explode hostile @a[distance=..60] ~ ~ ~ 1 0.5
execute if score @s ms.arta_timer matches 1 run playsound minecraft:block.netherite_block.fall hostile @a[distance=..80] ~ ~ ~ 1 0.6
execute if score @s ms.arta_timer matches 1 run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 3 normal
execute if score @s ms.arta_timer matches 1 run particle minecraft:squid_ink ~ ~ ~ 2.5 0.3 2.5 0.05 60 normal
execute if score @s ms.arta_timer matches 1 run particle minecraft:soul_fire_flame ~ ~ ~ 2.0 0.3 2.0 0.08 40 normal

# Shockwave damage (close burst immediately, expanding ring delayed)
execute if score @s ms.arta_timer matches 1 run function minesouls:artorias/attack/slam/shockwave

# After 5 ticks: enter recovery
execute if score @s ms.arta_timer matches 5.. run scoreboard players set @s ms.arta_state 7
execute if score @s ms.arta_timer matches 5.. run scoreboard players set @s ms.arta_timer 0
