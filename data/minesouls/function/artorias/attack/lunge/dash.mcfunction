# Knight Artorias – Abyssal Lunge: Dash (state 2)
# Rapid forward burst toward the player's last known position.
# Phase 1: 1.8 blocks/tick  |  Phase 2: 2.6 blocks/tick
# Runs as the base entity at its position.

# Apply dash pose
function minesouls:artorias/visual/pose_lunge_dash

# Tick 1: play lunge sound and spawn burst particles at start
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.player.attack.sweep hostile @a[distance=..60] ~ ~ ~ 1 0.7
execute if score @s ms.arta_timer matches 1 run particle minecraft:sweep_attack ~ ~1 ~ 0.5 0.8 0.5 0.05 5 normal

# Every tick during dash: burst forward and trail particles
# Phase 1 dash speed
execute if score @s ms.arta_phase matches 1 run teleport @s ^ ^ ^1.8
# Phase 2 dash speed (faster)
execute if score @s ms.arta_phase matches 2 run teleport @s ^ ^ ^2.6

# Abyss trail particles behind the dash
particle minecraft:squid_ink ~ ~1 ~ 0.2 0.6 0.2 0.02 6 normal
particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.8 0.3 0.04 8 normal

# Hit detection: check for players in a forward cone each tick
function minesouls:artorias/attack/lunge/hit

# After 10 ticks: transition to recovery
execute if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_state 3
execute if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_timer 0
