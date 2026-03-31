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

# Ranger-specific perk descriptions
execute if score @s ms.class matches 3 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Focused","color":"gold","bold":true},{"text":" – standing still for 3s boosts next shot damage by 20%","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Hit and Run","color":"gold","bold":true},{"text":" – firing an arrow grants +20% speed for 8 seconds","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Eagle's Nest","color":"gold","bold":true},{"text":" – slowly wallclimb, consumes hunger while climbing","color":"gray"}]

# Rogue-specific perk descriptions
execute if score @s ms.class matches 2 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Light Feet","color":"gold","bold":true},{"text":" – +20% speed while crouching","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Barrel Roll","color":"gold","bold":true},{"text":" – teleport 3 blocks forward on landing while crouched","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Pickpocket","color":"gold","bold":true},{"text":" – 10% bonus XP on hostile kills & permanent Luck I","color":"gray"}]
