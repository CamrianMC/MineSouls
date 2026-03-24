# Kidney Shot – Rogue Tier 3 Perk 1
# Critical hits inflict weakness for 5 seconds.

# Revoke advancement so it can trigger again on the next critical hit
advancement revoke @s only minesouls:perk/rogue/t3/kidney_shot

# Verify a hostile target is within melee range
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Apply Weakness I for 5 seconds to the nearest hostile within melee range
effect give @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1] minecraft:weakness 5 0

# Visual and audio feedback
playsound minecraft:entity.player.attack.crit player @s ~ ~ ~ 1 0.8
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.5 0.3 0.1 10
