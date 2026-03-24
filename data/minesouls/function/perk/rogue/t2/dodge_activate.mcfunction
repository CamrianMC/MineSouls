# Dodge – Activation handler
# Triggers the invulnerability window and starts the cooldown.

# Set invulnerability window (10 ticks) and cooldown (100 ticks = 5 seconds)
scoreboard players set @s ms.dodge_timer 10
scoreboard players set @s ms.dodge_cd 100

# Visual and audio feedback
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 0.5 2
particle minecraft:cloud ~ ~1 ~ 0.3 0.5 0.3 0.05 10
