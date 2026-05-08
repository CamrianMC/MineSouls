# Knight Artorias – Somersault Slam: Airborne (state 5)
# Boss launches upward 4 blocks on tick 1, hovers briefly, then slams down.
# Runs as the base entity at its position.

# Apply airborne pose
function minesouls:artorias/visual/pose_slam_air

# Tick 1: leap upward
execute if score @s ms.arta_timer matches 1 run teleport @s ~ ~4 ~
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.phantom.flap hostile @a[distance=..60] ~ ~ ~ 1 0.5
execute if score @s ms.arta_timer matches 1 run particle minecraft:cloud ~ ~0 ~ 1.0 0.5 1.0 0.05 20 normal

# Rising trail particles while airborne
particle minecraft:squid_ink ~ ~ ~ 0.3 0.3 0.3 0.02 4 normal
particle minecraft:soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.04 5 normal

# After 15 ticks: transition to impact state (state 6); do NOT call impact directly
execute if score @s ms.arta_timer matches 15.. run scoreboard players set @s ms.arta_state 6
execute if score @s ms.arta_timer matches 15.. run scoreboard players set @s ms.arta_timer 0
