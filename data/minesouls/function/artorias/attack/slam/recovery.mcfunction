# Knight Artorias – Somersault Slam: Recovery (state 7)
# Vulnerability window after slamming. 25 ticks then return to idle.
# Phase 1 cooldown: 80  |  Phase 2: 50
# Runs as the base entity at its position.

# Apply recovery pose
function minesouls:artorias/visual/pose_slam_recovery

# After 25 ticks: return to idle
execute if score @s ms.arta_timer matches 25.. run scoreboard players set @s ms.arta_state 0
execute if score @s ms.arta_timer matches 25.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_timer matches 25.. if score @s ms.arta_phase matches 1 run scoreboard players set @s ms.arta_attack_cd 80
execute if score @s ms.arta_timer matches 25.. if score @s ms.arta_phase matches 2 run scoreboard players set @s ms.arta_attack_cd 50
