# Band-aid – Mage Tier 1 Perk 3
# Grants Regeneration I (amplifier 0) for 8 seconds. Costs 120 mana.

# Check mana
execute unless score @s ms.mana matches 120.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 120.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 120

# Apply Regeneration I for 8 seconds (amplifier 0, visible particles)
effect give @s minecraft:regeneration 8 0

# Feedback
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1 1
particle minecraft:heart ~ ~2 ~ 0.3 0.3 0.3 0 3
#tellraw @s [{"text":"Band-aid applied!","color":"green"}]
