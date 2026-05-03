# Calloused Veteran – Warrior Tier 4 Perk 3
# +4 armor rating at all times. Stacks with all armor.

# Apply the armor modifier if not already active
execute unless entity @s[tag=ms_calloused_active] run attribute @s minecraft:armor modifier add minesouls:calloused_veteran 4 add_value
tag @s add ms_calloused_active

# Add resistance 1 if player has over 20 armor to simulate >20 armor rating
execute if entity @s[tag=ms_calloused_active] if score @s ms.armor_rating matches 21.. run effect give @s minecraft:resistance 1 0 true
