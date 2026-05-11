# Dark Ball Tick – global tick for Manus' descending dark energy balls.
# Called once per game tick from tick.mcfunction.
# Handles three jobs:
#   1. Emit dark particle trail to make the ball visible.
#   2. Move each ball downward to simulate descent.
#   3. Detect balls whose descent timer has expired and trigger the shockwave.

# --- Step 1: Dark particle trail ---
# Dense void core
execute as @e[tag=ms_manus_dark_ball] at @s run particle minecraft:squid_ink ~ ~ ~ 0.35 0.35 0.35 0.02 20 normal
# Glowing dragon-breath aura – purple haze visible at range
execute as @e[tag=ms_manus_dark_ball] at @s run particle minecraft:dragon_breath ~ ~ ~ 0.6 0.6 0.6 0.01 40 normal
# Soul-fire wisps for eerie inner glow
execute as @e[tag=ms_manus_dark_ball] at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.4 0.4 0.4 0.03 12 normal
# Reverse-portal sparkles – deep purple shards
execute as @e[tag=ms_manus_dark_ball] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.5 0.5 0.5 0.04 15 normal

# --- Step 2: Descend each ball toward the ground ---
# 0.133 blocks/tick gives ~8 blocks of descent over the maximum 60-tick flight.
execute as @e[tag=ms_manus_dark_ball] at @s run teleport @s ~ ~-0.133 ~

# --- Step 3: Decrement descent timers ---
scoreboard players remove @e[tag=ms_manus_dark_ball] ms.manus_dark_timer 1

# --- Step 4: Impact – trigger shockwave for balls whose timer has expired ---
execute as @e[tag=ms_manus_dark_ball,scores={ms.manus_dark_timer=..0}] at @s run function minesouls:manus/dark_ball_hit

# --- Step 5: Remove spent dark balls ---
kill @e[tag=ms_manus_dark_ball,scores={ms.manus_dark_timer=..0}]
