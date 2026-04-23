# Frosty Hit – Apply damage at the frosty snowball impact point.
# Runs as the orphaned marker, at the marker's position (impact point).
# Deals 1 damage to the nearest hostile entity within 1.5 blocks.

# Find and damage the nearest hostile (attributed to nearest Mage with Frosty perk)
damage @e[type=#minesouls:hostile,distance=..3,sort=nearest,limit=1] 2 minecraft:freeze

# Impact effects
particle minecraft:item_snowball ~ ~ ~ 0.2 0.2 0.2 0.1 8
playsound minecraft:block.snow.break player @a[distance=..16] ~ ~ ~ 1 1
