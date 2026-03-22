# Tier 3 perk handler – Cost: 30 experience levels
# Called from select_perk.mcfunction with ms.cb_perk set (1-3).

# Check the player hasn't already selected a Tier 3 perk
execute if score @s ms.t3_perk matches 1.. run tellraw @s {"text":"You already selected a Tier 3 perk!","color":"red"}
execute if score @s ms.t3_perk matches 1.. run return 0

# Check tier prerequisite (must have completed Tier 2)
execute unless score @s ms.class_tier matches 2.. run tellraw @s {"text":"You must complete Tier 2 first!","color":"red"}
execute unless score @s ms.class_tier matches 2.. run return 0

# Check experience level requirement
execute unless entity @s[level=30..] run tellraw @s {"text":"You need at least 30 experience levels for Tier 3!","color":"red"}
execute unless entity @s[level=30..] run return 0

# Consume cost
experience add @s -30 levels

# Set the selected perk and update class tier
scoreboard players operation @s ms.t3_perk = @s ms.cb_perk
scoreboard players set @s ms.class_tier 3

# Notify the player
tellraw @s [{"text":"Tier 3 Perk ","color":"green"},{"score":{"name":"@s","objective":"ms.cb_perk"}},{"text":" selected!","color":"green"}]

# Warrior-specific perk descriptions
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Thunder Clap","color":"gold","bold":true},{"text":" – Landing from 2+ blocks damages and knocks back nearby enemies","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Concussion","color":"gold","bold":true},{"text":" – Critical hits stun enemies for 3 seconds (10s cooldown)","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Parry","color":"gold","bold":true},{"text":" – Blocking just before a melee attack stuns the attacker for 5 seconds","color":"gray"}]
