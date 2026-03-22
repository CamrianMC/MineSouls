# Tier 1 perk handler – Cost: 5 experience levels
# Called from select_perk.mcfunction with ms.cb_perk set (1-3).

# Check the player hasn't already selected a Tier 1 perk
execute if score @s ms.t1_perk matches 1.. run tellraw @s {"text":"You already selected a Tier 1 perk!","color":"red"}
execute if score @s ms.t1_perk matches 1.. run return 0

# Tier 1 has no tier prerequisite (first tier)

# Check experience level requirement
execute unless entity @s[level=5..] run tellraw @s {"text":"You need at least 5 experience levels for Tier 1!","color":"red"}
execute unless entity @s[level=5..] run return 0

# Consume cost
experience add @s -5 levels

# Set the selected perk and update class tier
scoreboard players operation @s ms.t1_perk = @s ms.cb_perk
scoreboard players set @s ms.class_tier 1

# Notify the player
tellraw @s [{"text":"Tier 1 Perk ","color":"green"},{"score":{"name":"@s","objective":"ms.cb_perk"}},{"text":" selected!","color":"green"}]

# Warrior-specific perk descriptions
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Charge","color":"gold","bold":true},{"text":" – +20% speed when looking at enemies","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Turtle Shell","color":"gold","bold":true},{"text":" – 20% damage reduction while blocking","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Javelineer","color":"gold","bold":true},{"text":" – +2 thrown projectile damage","color":"gray"}]
