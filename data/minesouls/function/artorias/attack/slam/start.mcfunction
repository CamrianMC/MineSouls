# Knight Artorias – Somersault Slam: Windup (state 4)
# Arms raise overhead for 20 ticks to telegraph the incoming leap.
# Boss faces the target and stays grounded during this window.
# Runs as the base entity at its position.

# Apply windup pose
function minesouls:artorias/visual/pose_slam_windup

# Tick 1: rising charge sound + particle warning
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.warden.sonic_charge hostile @a[distance=..60] ~ ~ ~ 1 0.6
execute if score @s ms.arta_timer matches 1 run particle minecraft:soul_fire_flame ~ ~2 ~ 0.5 0.5 0.5 0.05 20 normal

# Face target throughout windup
tag @a[distance=..60,sort=nearest,limit=1] add ms_arta_slam_aim
execute if entity @a[tag=ms_arta_slam_aim] run teleport @s ~ ~ ~ facing entity @a[tag=ms_arta_slam_aim, limit=1] eyes
tag @a[tag=ms_arta_slam_aim] remove ms_arta_slam_aim

# Phase 2: halve windup duration by advancing the timer an extra tick each game tick
execute if score @s ms.arta_phase matches 2 run scoreboard players add @s ms.arta_timer 1

# After 20 ticks: pin a slam-target marker at the nearest player and enter air state
# Using matches 20.. so the pin still fires even if the timer jumps past 20 (e.g. in phase 2)
execute if score @s ms.arta_timer matches 20.. run tag @a[distance=..60,sort=nearest,limit=1] add ms_arta_slam_pin
execute if score @s ms.arta_timer matches 20.. as @a[tag=ms_arta_slam_pin] at @s run summon minecraft:marker ~ ~ ~ {Tags:["ms_arta_slam_target"]}
execute if score @s ms.arta_timer matches 20.. run tag @a[tag=ms_arta_slam_pin] remove ms_arta_slam_pin

execute if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_state 5
execute if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_timer 0
