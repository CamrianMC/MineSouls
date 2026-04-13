# Frosty Snowball Tick – Global tick for frosty snowball hit detection.
# Detects when a frosty snowball despawns (hit something) by checking for
# orphaned rider markers that lost their vehicle.

# Step 1: Mark all rider markers for hit checking
tag @e[type=marker,tag=ms_frosty_rider] add ms_frosty_check

# Step 2: Clear the mark for riders that still have a vehicle (snowball still flying).
execute as @e[type=marker,tag=ms_frosty_check] on vehicle on passengers run tag @s remove ms_frosty_check

# Step 3: Process hits for orphaned riders (snowball hit and despawned)
execute as @e[type=marker,tag=ms_frosty_check] at @s run function minesouls:perk/mage/t2/frosty_hit

# Step 4: Kill processed rider markers
kill @e[type=marker,tag=ms_frosty_check]
