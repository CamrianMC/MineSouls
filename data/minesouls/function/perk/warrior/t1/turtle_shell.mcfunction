# Turtle Shell – Warrior Tier 1 Perk 2
# Reduces damage taken by 20% while the player is blocking with a shield.
# Grants Resistance I for 1 second, refreshed every tick while blocking.

execute if predicate minesouls:blocking_with_shield run effect give @s minecraft:resistance 1 0 true
