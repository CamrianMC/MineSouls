# Knight Artorias – Abyssal Lunge: Windup (state 1)
# Boss freezes in place, sword pulled back, 15-tick telegraph before dash.
# Runs as the base entity at its position.

# Apply windup pose
function minesouls:artorias/visual/pose_lunge_windup

# Tick 1: play charge sound and spawn leading particles
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.warden.sonic_charge hostile @a[distance=..60] ~ ~ ~ 0.8 1.4
execute if score @s ms.arta_timer matches 1 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.8 0.3 0.05 15 normal
execute if score @s ms.arta_timer matches 1 run particle minecraft:squid_ink ~ ~1 ~ 0.3 0.8 0.3 0.03 10 normal

# Face the nearest player throughout the windup
tag @a[distance=..60,sort=nearest,limit=1] add ms_arta_lunge_aim
execute if entity @a[tag=ms_arta_lunge_aim] run teleport @s ~ ~ ~ facing entity @a[tag=ms_arta_lunge_aim,limit=1] eyes
tag @a[tag=ms_arta_lunge_aim] remove ms_arta_lunge_aim

# Phase 2: halve windup duration by advancing the timer an extra tick each game tick
execute if score @s ms.arta_phase matches 2 run scoreboard players add @s ms.arta_timer 1

# After 15 ticks: transition to dash
execute if score @s ms.arta_timer matches 15.. run scoreboard players set @s ms.arta_state 2
execute if score @s ms.arta_timer matches 15.. run scoreboard players set @s ms.arta_timer 0
