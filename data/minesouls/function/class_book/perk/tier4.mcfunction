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

# Warrior-specific perk descriptions
execute if score @s ms.class matches 1 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Adrenaline Rush","color":"gold","bold":true},{"text":" – +40% speed, haste, and melee damage when ≤ 50% HP","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Barbaric Training","color":"gold","bold":true},{"text":" – +20% melee damage when off hand is empty","color":"gray"}]
execute if score @s ms.class matches 1 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Calloused Veteran","color":"gold","bold":true},{"text":" – +4 armor rating at all times, stacks with all armor","color":"gray"}]

# Ranger-specific perk descriptions
execute if score @s ms.class matches 3 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Survival Instincts","color":"dark_aqua","bold":true},{"text":" – Nearby hostiles glow while crouching; stand still 5s for bonfire distance","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Hawkeye","color":"dark_aqua","bold":true},{"text":" – Receive 1 arrow on successful ranged attack","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Disengage","color":"dark_aqua","bold":true},{"text":" – Crouch while falling to jump backwards, cancelling momentum (costs 2 hunger)","color":"gray"}]

# Rogue-specific perk descriptions
execute if score @s ms.class matches 2 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Mark of Sacrifice","color":"dark_green","bold":true},{"text":" – Critical hits mark target for +2 damage from all sources for 5s","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Backstab","color":"dark_green","bold":true},{"text":" – Attacks from behind while crouching do 10x damage","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Nightfall","color":"dark_green","bold":true},{"text":" – Night vision and +20% melee damage while in darkness","color":"gray"}]

# Mage-specific perk descriptions
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Zeus","color":"gold","bold":true},{"text":" – Fires a bolt of lightning at the cursor. Costs 400 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Bodyguard","color":"gold","bold":true},{"text":" – Summons two iron golems that attack hostiles for 30 seconds. Costs 800 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Blink","color":"gold","bold":true},{"text":" – Instantly teleports you forward 10 blocks. Costs 200 mana.","color":"gray"}]

# Mage: scale up mana system for T4 (1600 max, up from 1200)
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana_max 1600
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana 1600

# Mage: give spellbook based on selected T4 perk
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 1 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Zeus","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Fires a bolt of lightning","italic":true,"color":"gray"},{"text":"at the cursor.","italic":true,"color":"gray"},{"text":"Cost: 400 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:10}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_zeus"] 1
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 2 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Bodyguard","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Summons two iron golems that","italic":true,"color":"gray"},{"text":"attack hostiles for 30 seconds.","italic":true,"color":"gray"},{"text":"Cost: 800 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:11}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_bodyguard"] 1
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 3 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Blink","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Instantly teleports you","italic":true,"color":"gray"},{"text":"forward 10 blocks.","italic":true,"color":"gray"},{"text":"Cost: 200 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:12}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_blink"] 1
