# Per-player atmospheric effects for players inside the Abyss dimension.
# Called from the global tick as: execute as @a[predicate=minesouls:in_abyss] at @s

# Hovering ash particles — low speed keeps them drifting in place
particle minecraft:ash ~ ~1 ~ 2 2 2 0 5 normal

# Void-mote (squid ink) particles — scattered higher up, zero velocity
particle minecraft:squid_ink ~ ~1.5 ~ 3 2 3 0 2 normal
