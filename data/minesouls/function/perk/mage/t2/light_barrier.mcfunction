# Light Barrier – Mage Tier 2 Perk 3
# Reduces all damage taken by 20% for 15 seconds. Costs 200 mana.
# Uses Resistance I (amplifier 0) which provides exactly 20% damage reduction.

# Check mana
execute unless score @s ms.mana matches 200.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 200.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 200

# Apply Resistance I for 15 seconds (amplifier 0 = 20% damage reduction)
effect give @s minecraft:resistance 15 0

# Feedback
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1 1
particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 0.5 20
# tellraw @s [{"text":"Light Barrier activated!","color":"yellow"}]
