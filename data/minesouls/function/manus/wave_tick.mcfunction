# Wave Tick – global tick for Manus' dark-magic wave projectiles.
# Called once per game tick from the main tick.mcfunction.
# Handles two jobs:
#   1. Emit dark particle trail from all flying wave projectiles.
#   2. Detect orphaned rider markers (fireball despawned on impact) and apply hit damage.

# --- Step 1: Dark particle trail from live wave riders ---
# The marker passenger travels with the fireball, so its position IS the fireball position.
execute as @e[type=minecraft:marker,tag=ms_manus_wave_rider] at @s run particle minecraft:dragon_breath ~ ~ ~ 0.6 0.6 0.6 0.01 20 normal
execute as @e[type=minecraft:marker,tag=ms_manus_wave_rider] at @s run particle minecraft:squid_ink ~ ~ ~ 0.35 0.35 0.35 0.02 8 normal

# --- Step 2: Orphan-rider hit detection (same pattern as mage fireball perk) ---

# Mark all wave riders for checking
tag @e[type=minecraft:marker,tag=ms_manus_wave_rider] add ms_manus_wave_check

# Remove the check-mark from riders that still have a vehicle (fireball still flying)
execute as @e[type=minecraft:marker,tag=ms_manus_wave_check] on vehicle on passengers run tag @s remove ms_manus_wave_check

# Process orphaned riders (fireball hit something and despawned)
execute as @e[type=minecraft:marker,tag=ms_manus_wave_check] at @s run function minesouls:manus/wave_hit

# Kill processed orphaned markers
kill @e[type=minecraft:marker,tag=ms_manus_wave_check]
