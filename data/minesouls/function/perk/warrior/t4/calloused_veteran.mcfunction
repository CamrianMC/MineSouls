# Calloused Veteran – Warrior Tier 4 Perk 3
# +4 armor rating at all times. Stacks with all armor.

# Apply the armor modifier if not already active (only while alive)
# Remove first to avoid silent failure if the modifier persisted through death
execute if entity @s[predicate=minesouls:is_alive] unless entity @s[tag=ms_calloused_active] run attribute @s minecraft:armor modifier remove minesouls:calloused_veteran
execute if entity @s[predicate=minesouls:is_alive] unless entity @s[tag=ms_calloused_active] run attribute @s minecraft:armor modifier add minesouls:calloused_veteran 4 add_value
execute if entity @s[predicate=minesouls:is_alive] run tag @s add ms_calloused_active

# Add resistance 1 if player has over 20 armor to simulate >20 armor rating
execute if entity @s[predicate=minesouls:is_alive] if entity @s[tag=ms_calloused_active] if score @s ms.armor_rating matches 21.. run effect give @s minecraft:resistance 1 0 true
