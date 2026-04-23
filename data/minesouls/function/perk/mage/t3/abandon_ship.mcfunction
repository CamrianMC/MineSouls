# Abandon Ship! – Mage Tier 3 Perk 3
# Grants massive jump boost and slow falling for 15 seconds.
# Costs 300 mana.

# Check mana
execute unless score @s ms.mana matches 300.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 300.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 300

# Apply Jump Boost V (amplifier 4) for 15 seconds – massive jump height
effect give @s minecraft:jump_boost 15 9

# Apply Slow Falling for 15 seconds – safe landing
effect give @s minecraft:slow_falling 15 0

# Feedback
playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.5 0.1 0.5 0.1 20
# tellraw @s [{"text":"Abandon Ship!","color":"aqua"}]
