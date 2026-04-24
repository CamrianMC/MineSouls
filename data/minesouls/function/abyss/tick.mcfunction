# Per-player atmospheric effects for players inside the Abyss dimension.
# Called from the global tick as: execute as @a[predicate=minesouls:in_abyss] at @s

# Hovering ash particles — velocity parameter is 0 (no movement); spread (2 2 2) gives spatial scatter
particle minecraft:ash ~ ~1 ~ 2 2 2 0 5 normal

# Void-mote (squid ink) particles — spread (3 2 3) for scatter; velocity 0 keeps them hovering
particle minecraft:squid_ink ~ ~1.5 ~ 3 2 3 0 2 normal
