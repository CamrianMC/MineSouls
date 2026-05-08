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

# Ranger-specific perk descriptions
execute if score @s ms.class matches 3 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Ricochet","color":"dark_aqua","bold":true},{"text":" – Arrows that hit walls deflect toward nearby hostile mobs","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Piercing Shot","color":"dark_aqua","bold":true},{"text":" – Arrows pass through enemies and continue flying","color":"gray"}]
execute if score @s ms.class matches 3 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Bleachscoped","color":"dark_aqua","bold":true},{"text":" – 1.5x damage on headshots","color":"gray"}]

# Rogue-specific perk descriptions
execute if score @s ms.class matches 2 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Kidney Shot","color":"dark_green","bold":true},{"text":" – Critical hits inflict weakness for 5 seconds","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Cheap Shot","color":"dark_green","bold":true},{"text":" – 20% increased bow/crossbow damage while crouched","color":"gray"}]
execute if score @s ms.class matches 2 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Rip and Tear","color":"dark_green","bold":true},{"text":" – Melee hits inflict bleed (1 damage per second for 5 seconds)","color":"gray"}]

# Mage-specific perk descriptions
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Hurricane","color":"gold","bold":true},{"text":" – Conjures a burst of wind that damages and knocks back enemies in a cone. Costs 300 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Druid","color":"gold","bold":true},{"text":" – Summons 4 wolves that attack hostiles for 30 seconds. Costs 300 mana.","color":"gray"}]
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":"  → ","color":"gray"},{"text":"Abandon Ship!","color":"gold","bold":true},{"text":" – Grants massive jump boost and slow fall for 15 seconds. Costs 300 mana.","color":"gray"}]

# Mage: scale up mana system for T3 (1200 max, up from 800)
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana_max 1200
execute if score @s ms.class matches 4 run scoreboard players set @s ms.mana 1200

# Mage: give spellbook based on selected T3 perk
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 1 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Hurricane","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Conjures a burst of wind that","italic":true,"color":"gray"},{"text":"damages and knocks back enemies.","italic":true,"color":"gray"},{"text":"Cost: 300 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:7}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_hurricane"] 1
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 2 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Druid","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Summons 4 wolves that attack","italic":true,"color":"gray"},{"text":"hostiles for 30 seconds.","italic":true,"color":"gray"},{"text":"Cost: 300 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:8}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_druid"] 1
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 3 run give @s minecraft:warped_fungus_on_a_stick[minecraft:custom_name={"text":"Spellbook: Abandon Ship!","italic":false,"color":"dark_purple"},minecraft:lore=[{"text":"Grants massive jump boost and","italic":true,"color":"gray"},{"text":"slow fall for 15 seconds.","italic":true,"color":"gray"},{"text":"Cost: 300 mana","italic":false,"color":"blue"}],minecraft:custom_data={minesouls:{spellbook:9}},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:unbreakable={},minecraft:item_model="minesouls:spellbook_abandon_ship"] 1

# Grant "Growing Powerful" achievement on tier 3 perk unlock
advancement grant @s only minesouls:achievement/growing_powerful
