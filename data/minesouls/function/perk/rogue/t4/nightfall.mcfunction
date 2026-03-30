# Nightfall – Rogue Tier 4 Perk 3
# Enhanced eyesight (night vision) and +20% melee damage while in darkness.

# If not in darkness, remove effects and stop
execute unless predicate minesouls:in_darkness if entity @s[tag=ms_nightfall_active] run attribute @s minecraft:attack_damage modifier remove minesouls:nightfall
execute unless predicate minesouls:in_darkness if entity @s[tag=ms_nightfall_active] run effect clear @s minecraft:night_vision
execute unless predicate minesouls:in_darkness run tag @s remove ms_nightfall_active
execute unless predicate minesouls:in_darkness run return 0

# In darkness: apply night vision and damage modifier
# Duration 13s avoids the client-side flickering (which starts at ≤10s remaining)
effect give @s minecraft:night_vision 13 0 true
execute unless entity @s[tag=ms_nightfall_active] run attribute @s minecraft:attack_damage modifier add minesouls:nightfall 0.2 add_multiplied_base
tag @s add ms_nightfall_active
