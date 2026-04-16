# Zeus Raycast – Steps forward 0.5 blocks at a time from the player's eye position.
# Stops when a non-air block is found or max range (50 blocks = 100 steps) is reached.
# Summons a lightning bolt at the final position.

# Increment step counter
scoreboard players add @s ms.zeus_steps 1

# Check if we've hit a solid block (not passable)
execute unless block ~ ~ ~ #minecraft:replaceable unless block ~ ~ ~ minecraft:light run function minesouls:perk/mage/t4/zeus_strike
execute unless block ~ ~ ~ #minecraft:replaceable unless block ~ ~ ~ minecraft:light run return 0

# Check max range (100 steps × 0.5 blocks = 50 blocks)
execute if score @s ms.zeus_steps matches 100.. run function minesouls:perk/mage/t4/zeus_strike
execute if score @s ms.zeus_steps matches 100.. run return 0

# Continue stepping forward
execute positioned ^ ^ ^0.5 run function minesouls:perk/mage/t4/zeus_raycast
