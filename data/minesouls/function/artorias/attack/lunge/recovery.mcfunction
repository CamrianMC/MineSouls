# Knight Artorias – Abyssal Lunge: Recovery (state 3)
# Brief vulnerability window after the lunge ends.
# After 20 ticks return to idle and start attack cooldown.
# Phase 1 cooldown: 80 ticks  |  Phase 2 cooldown: 50 ticks
# Runs as the base entity at its position.

# Apply recovery pose
function minesouls:artorias/visual/pose_lunge_recovery

# After 20 ticks: return to idle and apply cooldown
execute if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_state 0
execute if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_timer matches 20.. if score @s ms.arta_phase matches 1 run scoreboard players set @s ms.arta_attack_cd 80
execute if score @s ms.arta_timer matches 20.. if score @s ms.arta_phase matches 2 run scoreboard players set @s ms.arta_attack_cd 50
