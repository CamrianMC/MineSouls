# Wave Tick – global tick for Manus' dark-magic wave projectiles.
# Called once per game tick from the main tick.mcfunction.
# Handles two jobs:
#   1. Emit dark particle trail from all flying wave projectiles.
#   2. Detect orphaned rider markers (fireball despawned on impact) and apply hit damage.

# --- Step 1: Dark particle trail from live wave riders ---
# The marker passenger travels with the fireball, so its position IS the fireball position.
# Large outer dragon-breath cloud – purple, unmistakable at range
execute as @e[type=minecraft:marker,tag=ms_manus_wave_rider] at @s run particle minecraft:dragon_breath ~ ~ ~ 1.0 1.0 1.0 0.01 60 normal
# Void core – dense black ink at the centre
execute as @e[type=minecraft:marker,tag=ms_manus_wave_rider] at @s run particle minecraft:squid_ink ~ ~ ~ 0.3 0.3 0.3 0.02 20 normal
# Soul-fire wisps threading outward – eerie blue glow
execute as @e[type=minecraft:marker,tag=ms_manus_wave_rider] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.6 0.6 0.6 0.03 15 normal
# Reverse-portal shards – deep purple sparkles visible at distance
execute as @e[type=minecraft:marker,tag=ms_manus_wave_rider] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.7 0.7 0.7 0.05 20 normal

# --- Step 2: Orphan-rider hit detection (same pattern as mage fireball perk) ---

# Mark all wave riders for checking
tag @e[type=minecraft:marker,tag=ms_manus_wave_rider] add ms_manus_wave_check

# Remove the check-mark from riders that still have a vehicle (fireball still flying)
execute as @e[type=minecraft:marker,tag=ms_manus_wave_check] on vehicle on passengers run tag @s remove ms_manus_wave_check

# Process orphaned riders (fireball hit something and despawned)
execute as @e[type=minecraft:marker,tag=ms_manus_wave_check] at @s run function minesouls:manus/wave_hit

# Kill processed orphaned markers
kill @e[type=minecraft:marker,tag=ms_manus_wave_check]
