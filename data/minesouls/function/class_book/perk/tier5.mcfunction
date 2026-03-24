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

# Warrior-specific perk descriptions
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Avernus","color":"gold","bold":true},{"text":" – Negates fire damage; being on fire slowly regenerates HP","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Tough as Nails","color":"gold","bold":true},{"text":" – Cannot take more than 5 damage in one hit","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Impenetrable Wall","color":"gold","bold":true},{"text":" – Shields have infinite durability; shield blocks damage and knock back nearby enemies","color":"gray"}]

# Initialize Tough as Nails health tracker to current health
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 2 run scoreboard players operation @s ms.tan_prev = @s ms.health

# Initialize Impenetrable Wall block tracker to current stat
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 3 run scoreboard players operation @s ms.iw_prev = @s ms.iw_blocked

# Rogue-specific perk descriptions
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Cheat Death","color":"gold","bold":true},{"text":" – Fatal damage leaves you at 1 HP. 2 minute cooldown.","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Shinobi","color":"gold","bold":true},{"text":" – Negates fall damage","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Into Thin Air","color":"gold","bold":true},{"text":" – Invisible while crouching; attacks disable for 10 seconds","color":"gray"}]

# Initialize Shinobi health tracker to current health
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 2 run scoreboard players operation @s ms.shinobi_prev = @s ms.health
