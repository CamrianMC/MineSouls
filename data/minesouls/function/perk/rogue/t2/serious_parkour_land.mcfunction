# Serious Parkour – Landing handler
# Grants Speed I and Jump Boost I for 10 seconds.

# Apply speed and jump boost
effect give @s minecraft:speed 10 0 true
effect give @s minecraft:jump_boost 10 0 true

# Visual and audio feedback
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.5 2
particle minecraft:happy_villager ~ ~ ~ 0.5 0.5 0.5 0.1 15
