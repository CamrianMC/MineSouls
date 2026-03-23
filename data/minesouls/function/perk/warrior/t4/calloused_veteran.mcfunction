# Calloused Veteran – Warrior Tier 4 Perk 3
# +4 armor rating at all times. Stacks with all armor.

# Apply the armor modifier if not already active
execute unless entity @s[tag=ms_calloused_active] run attribute @s minecraft:generic.armor modifier add minesouls:calloused_veteran 4 add_value
tag @s add ms_calloused_active
