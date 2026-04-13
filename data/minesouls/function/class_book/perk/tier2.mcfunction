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

# Mage-specific perk descriptions
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Fireball","color":"gold","bold":true},{"text":" – Launches a ball of flame that damages and ignites hostile mobs. Costs 40 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Frosty","color":"gold","bold":true},{"text":" – Summons a snow golem turret for 30s. Snowballs deal 1 dmg. Costs 200 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Light Barrier","color":"gold","bold":true},{"text":" – Reduces all damage taken by 20% for 15 seconds. Costs 200 mana.","color":"gray"}]

# Mage: scale up mana system for T2 (800 max, up from 400)
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana_max 800
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana 800

# Mage: give spellbook based on selected T2 perk
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 1 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Fireball","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Launches a ball of flame that","italic":true,"color":"gray"},{"text":"damages and ignites hostiles.","italic":true,"color":"gray"},{"text":"Cost: 40 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:4}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_fireball"] 1
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 2 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Frosty","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Summons a snow golem turret","italic":true,"color":"gray"},{"text":"for 30s. Snowballs deal 1 dmg.","italic":true,"color":"gray"},{"text":"Cost: 200 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:5}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_frosty"] 1
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 3 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Light Barrier","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Reduces all damage taken by","italic":true,"color":"gray"},{"text":"20% for 15 seconds.","italic":true,"color":"gray"},{"text":"Cost: 200 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:6}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_light_barrier"] 1
