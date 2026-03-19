# Charge – Warrior Tier 1 Perk 1
# Looking at a hostile mob grants +20% movement speed (Speed I for 1 second).
# Checks 5 points along the player's line of sight (2, 4, 6, 8, 10 blocks).

# Clear any previous detection
tag @s remove ms_charge_found

# Raycast: check for hostile entities along the look direction
execute anchored eyes positioned ^ ^ ^2 if entity @e[distance=..2.5,type=#minesouls:hostile,limit=1] run tag @s add ms_charge_found
execute anchored eyes positioned ^ ^ ^4 if entity @e[distance=..2.5,type=#minesouls:hostile,limit=1] run tag @s add ms_charge_found
execute anchored eyes positioned ^ ^ ^6 if entity @e[distance=..3,type=#minesouls:hostile,limit=1] run tag @s add ms_charge_found
execute anchored eyes positioned ^ ^ ^8 if entity @e[distance=..3,type=#minesouls:hostile,limit=1] run tag @s add ms_charge_found
execute anchored eyes positioned ^ ^ ^10 if entity @e[distance=..3.5,type=#minesouls:hostile,limit=1] run tag @s add ms_charge_found

# Apply Speed I (20% boost) for 1 second when a hostile mob is detected
execute if entity @s[tag=ms_charge_found] run effect give @s minecraft:speed 1 0 true

# Clean up
tag @s remove ms_charge_found
