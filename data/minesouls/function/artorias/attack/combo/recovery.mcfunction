# Knight Artorias – Abyss Combo: Recovery (state 11)
# Post-chain vulnerability window. Returns to idle after 30 ticks (phase 1)
# or 20 ticks (phase 2).
# Runs as the base entity at its position.

# Apply combo recovery pose
function minesouls:artorias/visual/pose_combo_recovery

# Phase 1: transition after 30 ticks
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 30.. run scoreboard players set @s ms.arta_state 0
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 30.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 30.. run scoreboard players set @s ms.arta_attack_cd 80

# Phase 2: transition after 20 ticks
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_state 0
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 20.. run scoreboard players set @s ms.arta_attack_cd 50
