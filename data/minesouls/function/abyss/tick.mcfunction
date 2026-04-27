# Per-player atmospheric effects for players inside the Abyss dimension.
# Called from the global tick as: execute as @a[predicate=minesouls:in_abyss] at @s

# Hovering ash particles — velocity parameter is 0 (no movement); spread (2 2 2) gives spatial scatter
particle minecraft:ash ~ ~1 ~ 2 2 2 0 5 normal

# Void-mote (squid ink) particles — spread (3 2 3) for scatter; velocity 0 keeps them hovering
particle minecraft:squid_ink ~ ~1.5 ~ 3 2 3 0 2 normal

# Darkness effect to simulate the oppressive atmosphere of the Abyss — duration 5 seconds, amplifier 0 (level 1), hidden particles
effect give @s minecraft:darkness 5 0 true

# Ensure safe teleport
execute if score @s ms.abyss_init matches 1 run fill ~-1 ~ ~-1 ~1 ~2 ~1 minecraft:air replace
execute if score @s ms.abyss_init matches 1 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:blackstone replace
execute if score @s ms.abyss_init matches 1 if block ~ ~-1 ~ minecraft:blackstone run scoreboard players set @s ms.abyss_init 0

# Silence Wardens
execute as @e[type=minecraft:warden,distance=..50] run data merge entity @s {Silent:1b}
