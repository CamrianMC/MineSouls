# Phase 2 Check – reads Manus' current health and triggers the phase transition if
# health has dropped to or below 50% (512 of 1024).
# Runs as Manus at Manus (called from tick.mcfunction only while ms.manus_phase = 1).

# Store Manus' current health as an integer score (Health float × 1, truncated)
execute store result score @s ms.manus_temp run data get entity @s Health 1

# If health is at or below 512 (50% of 1024), enter Phase 2
execute if score @s ms.manus_temp matches ..512 run function minesouls:manus/phase2_trigger
