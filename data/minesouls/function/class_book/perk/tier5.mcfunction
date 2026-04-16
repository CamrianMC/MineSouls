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
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Cheat Death","color":"gold","bold":true},{"text":" – Fatal damage leaves you at 1 HP. 1 minute cooldown.","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Shinobi","color":"gold","bold":true},{"text":" – Negates fall damage","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Into Thin Air","color":"gold","bold":true},{"text":" – Invisible while crouching; attacks disable for 10 seconds","color":"gray"}]

# Ranger-specific perk descriptions
execute if score @s ms.class matches 3 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Sniper Elite","color":"gold","bold":true},{"text":" – Fired arrows are hitscan: instant travel, hit the first target in your crosshair","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Doom","color":"gold","bold":true},{"text":" – Bows and crossbows charge instantly and fire a spray of arrows","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Beast Mastery","color":"gold","bold":true},{"text":" – Your wolves have Strength II and heal you when they deal damage. Always have at least 1 wolf.","color":"gray"}]

# Mage-specific perk descriptions
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Armageddon","color":"gold","bold":true},{"text":" – Massive explosion: 20 damage to all hostiles within 20 blocks, survivors stunned 10s. Costs 2000 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Acheron","color":"gold","bold":true},{"text":" – Summons a Wither that attacks hostiles for 20 seconds. Costs 2000 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Fountain of Youth","color":"gold","bold":true},{"text":" – Fully heals all players within 20 blocks. Costs 2000 mana.","color":"gray"}]

# Mage: scale up mana system for T5 (2000 max, up from 1600)
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana_max 2000
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana 2000

# Mage: give spellbook based on selected T5 perk
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 1 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Armageddon","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Massive explosion: 20 damage to","italic":true,"color":"gray"},{"text":"hostiles in 20 blocks, stuns survivors.","italic":true,"color":"gray"},{"text":"Cost: 2000 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:13}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_armageddon"] 1
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 2 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Acheron","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Summons a Wither that attacks","italic":true,"color":"gray"},{"text":"hostiles for 20 seconds.","italic":true,"color":"gray"},{"text":"Cost: 2000 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:14}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_acheron"] 1
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 3 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Fountain of Youth","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Fully heals all players","italic":true,"color":"gray"},{"text":"within 20 blocks.","italic":true,"color":"gray"},{"text":"Cost: 2000 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:15}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_fountain_of_youth"] 1

