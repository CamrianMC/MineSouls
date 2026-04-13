# Barrel Roll – Landing handler
# Teleports the player 3 blocks forward in their horizontal facing direction.

# Teleport 3 blocks forward along the player's horizontal look direction
# (rotated ~ 0 zeroes out pitch so the teleport is always horizontal)
execute rotated ~ 0 positioned ^ ^ ^3 run tp @s ~ ~ ~

# Visual and audio feedback
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1.5
particle minecraft:cloud ~ ~ ~ 0.3 0.1 0.3 0.05 10
