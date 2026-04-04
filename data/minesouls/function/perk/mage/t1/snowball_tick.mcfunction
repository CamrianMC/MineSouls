# Snowball Tick – Global tick for spell snowball hit detection.
# Detects when a snowball despawns (hit something) by checking for orphaned
# rider markers that lost their vehicle.

# Step 1: Mark all rider markers for hit checking
tag @e[type=marker,tag=ms_sb_rider] add ms_sb_check

# Step 2: Clear the mark for riders that still have a vehicle (snowball still flying).
# "on vehicle" switches to the snowball, "on passengers" iterates back to the marker.
# If the snowball is gone, "on vehicle" fails and ms_sb_check remains.
execute as @e[type=marker,tag=ms_sb_check] on vehicle on passengers run tag @s remove ms_sb_check

# Step 3: Process hits for orphaned riders (snowball hit and despawned)
execute as @e[type=marker,tag=ms_sb_check] at @s run function minesouls:perk/mage/t1/snowball_hit

# Step 4: Kill processed rider markers
kill @e[type=marker,tag=ms_sb_check]
