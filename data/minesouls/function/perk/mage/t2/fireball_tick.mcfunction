# Fireball Tick – Global tick for fireball hit detection.
# Detects when a fireball snowball despawns (hit something) by checking for
# orphaned rider markers that lost their vehicle.

# Step 1: Mark all rider markers for hit checking
tag @e[type=marker,tag=ms_fb_rider] add ms_fb_check

# Step 2: Clear the mark for riders that still have a vehicle (snowball still flying).
execute as @e[type=marker,tag=ms_fb_check] on vehicle on passengers run tag @s remove ms_fb_check

# Step 3: Process hits for orphaned riders (snowball hit and despawned)
execute as @e[type=marker,tag=ms_fb_check] at @s run function minesouls:perk/mage/t2/fireball_hit

# Step 4: Kill processed rider markers
kill @e[type=marker,tag=ms_fb_check]
