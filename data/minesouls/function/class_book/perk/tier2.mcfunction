# Tier 2 perk handler – Cost: 15 experience levels
# Called from select_perk.mcfunction with ms.cb_perk set (1-3).

# Check the player hasn't already selected a Tier 2 perk
execute if score @s ms.t2_perk matches 1.. run tellraw @s {"text":"You already selected a Tier 2 perk!","color":"red"}
execute if score @s ms.t2_perk matches 1.. run return 0

# Check tier prerequisite (must have completed Tier 1)
execute unless score @s ms.class_tier matches 1.. run tellraw @s {"text":"You must complete Tier 1 first!","color":"red"}
execute unless score @s ms.class_tier matches 1.. run return 0

# Check experience level requirement
execute unless entity @s[level=15..] run tellraw @s {"text":"You need at least 15 experience levels for Tier 2!","color":"red"}
execute unless entity @s[level=15..] run return 0

# Consume cost
experience add @s -15 levels

# Set the selected perk and update class tier
scoreboard players operation @s ms.t2_perk = @s ms.cb_perk
scoreboard players set @s ms.class_tier 2

# Notify the player
tellraw @s [{"text":"Tier 2 Perk ","color":"green"},{"score":{"name":"@s","objective":"ms.cb_perk"}},{"text":" selected!","color":"green"}]

# Warrior-specific perk descriptions
execute if score @s ms.class matches 1 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Victory Rush","color":"gold","bold":true},{"text":" – Melee kills restore 4 HP (2 hearts)","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Second Wind","color":"gold","bold":true},{"text":" – Slowly restore health below 50% HP","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Aura Farming","color":"gold","bold":true},{"text":" – Ranged/AoE damage reduced while threats are nearby","color":"gray"}]

# Ranger-specific perk descriptions
execute if score @s ms.class matches 3 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Barbed Arrows","color":"dark_aqua","bold":true},{"text":" – arrows inflict bleed for 5 seconds","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Explosive Shot","color":"dark_aqua","bold":true},{"text":" – arrows trigger a small explosion on impact","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Venomous Arrows","color":"dark_aqua","bold":true},{"text":" – arrows inflict Slowness for 5 seconds","color":"gray"}]

# Rogue-specific perk descriptions
execute if score @s ms.class matches 2 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Leeching Strike","color":"dark_green","bold":true},{"text":" – Restores 1 HP on successful melee attack","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Dodge","color":"dark_green","bold":true},{"text":" – Crouching grants brief invulnerability (5s cooldown)","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Serious Parkour","color":"dark_green","bold":true},{"text":" – Landing from height grants speed and jump boost","color":"gray"}]
