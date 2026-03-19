# Tier 5 perk handler – Cost: 99 experience levels + 1 Elytra
# Called from select_perk.mcfunction with ms.cb_perk set (1-3).

# Check the player hasn't already selected a Tier 5 perk
execute if score @s ms.t5_perk matches 1.. run tellraw @s {"text":"You already selected a Tier 5 perk!","color":"red"}
execute if score @s ms.t5_perk matches 1.. run return 0

# Check tier prerequisite (must have completed Tier 4)
execute unless score @s ms.class_tier matches 4.. run tellraw @s {"text":"You must complete Tier 4 first!","color":"red"}
execute unless score @s ms.class_tier matches 4.. run return 0

# Check Elytra requirement (inventory check via clear 0)
execute store result score @s ms.cb_temp run clear @s minecraft:elytra 0
execute if score @s ms.cb_temp matches 0 run tellraw @s {"text":"You need an Elytra for Tier 5!","color":"red"}
execute if score @s ms.cb_temp matches 0 run return 0

# Check experience level requirement
execute unless entity @s[level=99..] run tellraw @s {"text":"You need at least 99 experience levels for Tier 5!","color":"red"}
execute unless entity @s[level=99..] run return 0

# Consume costs
clear @s minecraft:elytra 1
experience add @s -99 levels

# Set the selected perk and update class tier
scoreboard players operation @s ms.t5_perk = @s ms.cb_perk
scoreboard players set @s ms.class_tier 5

# Notify the player
tellraw @s [{"text":"Tier 5 Perk ","color":"green"},{"score":{"name":"@s","objective":"ms.cb_perk"}},{"text":" selected!","color":"green"}]
