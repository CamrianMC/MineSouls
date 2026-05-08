# Knight Artorias – Attack Selection (state 0)
# Chooses an attack based on:
#   • distance to the nearest player
#   • current phase (phase 2 shortens cooldowns)
#   • last attack used (prevents repeating the same attack twice in a row)
# Runs as the base entity at its position.

# Do nothing if global attack cooldown is still active
execute if score @s ms.arta_attack_cd matches 1.. run return 0

# Do nothing if no player is in range
execute unless entity @a[distance=..60,limit=1] run return 0

# --- Measure distance range to nearest player ---
# dist=1: close (< 6 blocks)  dist=2: mid (6–14)  dist=3: far (> 14)
scoreboard players set @s ms.arta_dist 3
tag @a[distance=..14,sort=nearest,limit=1] add ms_arta_range_check
execute if entity @a[tag=ms_arta_range_check] run scoreboard players set @s ms.arta_dist 2
tag @a[tag=ms_arta_range_check] remove ms_arta_range_check

tag @a[distance=..6,sort=nearest,limit=1] add ms_arta_range_check
execute if entity @a[tag=ms_arta_range_check] run scoreboard players set @s ms.arta_dist 1
tag @a[tag=ms_arta_range_check] remove ms_arta_range_check

# --- Choose attack ---
# Attack codes: 1 = lunge (state 1), 2 = slam (state 4), 3 = combo (state 8)

# Close range: prefer combo (3), fallback lunge (1) if last was combo
execute if score @s ms.arta_dist matches 1 unless score @s ms.arta_attack_choice matches 3 run scoreboard players set @s ms.arta_temp 3
execute if score @s ms.arta_dist matches 1 if score @s ms.arta_attack_choice matches 3 run scoreboard players set @s ms.arta_temp 1

# Mid range: prefer lunge (1), fallback combo (3) if last was lunge
execute if score @s ms.arta_dist matches 2 unless score @s ms.arta_attack_choice matches 1 run scoreboard players set @s ms.arta_temp 1
execute if score @s ms.arta_dist matches 2 if score @s ms.arta_attack_choice matches 1 run scoreboard players set @s ms.arta_temp 3

# Far range: prefer slam (2), fallback lunge (1) if last was slam
execute if score @s ms.arta_dist matches 3 unless score @s ms.arta_attack_choice matches 2 run scoreboard players set @s ms.arta_temp 2
execute if score @s ms.arta_dist matches 3 if score @s ms.arta_attack_choice matches 2 run scoreboard players set @s ms.arta_temp 1

# Save the chosen attack code
scoreboard players operation @s ms.arta_attack_choice = @s ms.arta_temp

# --- Transition to the chosen attack's opening state ---
# Lunge (choice=1) → state 1
execute if score @s ms.arta_attack_choice matches 1 run scoreboard players set @s ms.arta_state 1
execute if score @s ms.arta_attack_choice matches 1 run scoreboard players set @s ms.arta_timer 0

# Slam (choice=2) → state 4
execute if score @s ms.arta_attack_choice matches 2 run scoreboard players set @s ms.arta_state 4
execute if score @s ms.arta_attack_choice matches 2 run scoreboard players set @s ms.arta_timer 0

# Combo (choice=3) → state 8
execute if score @s ms.arta_attack_choice matches 3 run scoreboard players set @s ms.arta_state 8
execute if score @s ms.arta_attack_choice matches 3 run scoreboard players set @s ms.arta_timer 0
