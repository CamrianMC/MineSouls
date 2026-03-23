# Avernus – Warrior Tier 5 Perk 1
# Negates fire damage and being on fire slowly regenerates HP.
# Fire Resistance prevents all fire/lava damage.
# When the player is on fire (lava, fire aspect, etc.), Regeneration heals them.

# Grant constant fire resistance to negate all fire damage (refreshed every tick)
effect give @s minecraft:fire_resistance 2 0 true

# If on fire, grant regeneration (slow heal while burning)
execute if predicate minesouls:is_on_fire run effect give @s minecraft:regeneration 2 0 true
