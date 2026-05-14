# Knight Artorias – Phase 2 Health Check
# Reads current health and triggers the transition when below 500 (half of 1000).
# Only called while in phase 1 and not already in transition (states 0–11).
# Runs as the base entity at its position.

# Sample Health float into an integer score for comparison
execute store result score @s ms.arta_temp run data get entity @s Health 1

# Trigger if health has dropped to 499 or below
execute if score @s ms.arta_temp matches ..499 run scoreboard players set @s ms.arta_state 12
execute if score @s ms.arta_temp matches ..499 run scoreboard players set @s ms.arta_timer 0
