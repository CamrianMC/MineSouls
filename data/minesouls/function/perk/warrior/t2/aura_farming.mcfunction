# Aura Farming – Warrior Tier 2 Perk 3
# Ranged and AoE damage on the player reduced by ~20% (Resistance I).
# Grants Resistance I when nearby ranged projectiles or AoE threats are detected.

# Check for ranged projectiles within 10 blocks
execute if entity @e[type=#minesouls:ranged_projectile,distance=..10] run effect give @s minecraft:resistance 1 0 true

# Check for AoE threats within 8 blocks
execute if entity @e[type=#minesouls:aoe_threat,distance=..8] run effect give @s minecraft:resistance 1 0 true
