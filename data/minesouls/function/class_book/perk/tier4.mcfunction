# Tier 4 perk handler – Cost: 50 experience levels + 1 Nether Star
# Called from select_perk.mcfunction with ms.cb_perk set (1-3).

# Check the player hasn't already selected a Tier 4 perk
execute if score @s ms.t4_perk matches 1.. run tellraw @s {"text":"You already selected a Tier 4 perk!","color":"red"}
execute if score @s ms.t4_perk matches 1.. run return 0

# Check tier prerequisite (must have completed Tier 3)
execute unless score @s ms.class_tier matches 3.. run tellraw @s {"text":"You must complete Tier 3 first!","color":"red"}
execute unless score @s ms.class_tier matches 3.. run return 0

# Check Nether Star requirement (inventory check via clear 0)
execute store result score @s ms.cb_temp run clear @s minecraft:nether_star 0
execute if score @s ms.cb_temp matches 0 run tellraw @s {"text":"You need a Nether Star for Tier 4!","color":"red"}
execute if score @s ms.cb_temp matches 0 run return 0

# Check experience level requirement
execute unless entity @s[level=50..] run tellraw @s {"text":"You need at least 50 experience levels for Tier 4!","color":"red"}
execute unless entity @s[level=50..] run return 0

# Consume costs
clear @s minecraft:nether_star 1
experience add @s -50 levels

# Set the selected perk and update class tier
scoreboard players operation @s ms.t4_perk = @s ms.cb_perk
scoreboard players set @s ms.class_tier 4

# Notify the player
tellraw @s [{"text":"Tier 4 Perk ","color":"green"},{"score":{"name":"@s","objective":"ms.cb_perk"}},{"text":" selected!","color":"green"}]
