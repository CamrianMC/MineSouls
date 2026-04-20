# Show the player's current class and all selected perks in chat.
# Runs when ms.class_info >= 1.

# Reset trigger immediately
scoreboard players set @s ms.class_info 0

# Header
tellraw @s {"text":"══════ My Build ══════","color":"gold","bold":true}

# --- Class ---
execute if score @s ms.class matches 0 run tellraw @s [{"text":" Class: ","color":"white"},{"text":"None","color":"gray","italic":true}]
execute if score @s ms.class matches 1 run tellraw @s [{"text":" Class: ","color":"white"},{"text":"Warrior","color":"dark_red","bold":true}]
execute if score @s ms.class matches 2 run tellraw @s [{"text":" Class: ","color":"white"},{"text":"Rogue","color":"dark_green","bold":true}]
execute if score @s ms.class matches 3 run tellraw @s [{"text":" Class: ","color":"white"},{"text":"Ranger","color":"dark_aqua","bold":true}]
execute if score @s ms.class matches 4 run tellraw @s [{"text":" Class: ","color":"white"},{"text":"Mage","color":"dark_purple","bold":true}]

# --- Tier 1 Perk ---
execute if score @s ms.t1_perk matches 0 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"—","color":"gray"}]
# Warrior T1
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Charge","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Turtle Shell","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Javelineer","color":"white"}]
# Rogue T1
execute if score @s ms.class matches 2 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Light Feet","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Barrel Roll","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Pickpocket","color":"white"}]
# Ranger T1
execute if score @s ms.class matches 3 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Focused","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Hit and Run","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Eagle's Nest","color":"white"}]
# Mage T1
execute if score @s ms.class matches 4 if score @s ms.t1_perk matches 1 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Snowball","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t1_perk matches 2 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Goyim","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t1_perk matches 3 run tellraw @s [{"text":" T1: ","color":"gold"},{"text":"Band-aid","color":"white"}]

# --- Tier 2 Perk ---
execute if score @s ms.t2_perk matches 0 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"—","color":"gray"}]
# Warrior T2
execute if score @s ms.class matches 1 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Victory Rush","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Second Wind","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Aura Farming","color":"white"}]
# Rogue T2
execute if score @s ms.class matches 2 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Leeching Strike","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Dodge","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Serious Parkour","color":"white"}]
# Ranger T2
execute if score @s ms.class matches 3 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Barbed Arrows","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Explosive Shot","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Paralysis Arrows","color":"white"}]
# Mage T2
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 1 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Fireball","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 2 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Frosty","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t2_perk matches 3 run tellraw @s [{"text":" T2: ","color":"gold"},{"text":"Light Barrier","color":"white"}]

# --- Tier 3 Perk ---
execute if score @s ms.t3_perk matches 0 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"—","color":"gray"}]
# Warrior T3
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Thunder Clap","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Concussion","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Parry","color":"white"}]
# Rogue T3
execute if score @s ms.class matches 2 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Kidney Shot","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Cheap Shot","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Rip and Tear","color":"white"}]
# Ranger T3
execute if score @s ms.class matches 3 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Ricochet","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Piercing Shot","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Bleachscoped","color":"white"}]
# Mage T3
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 1 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Hurricane","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 2 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Druid","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t3_perk matches 3 run tellraw @s [{"text":" T3: ","color":"gold"},{"text":"Abandon Ship!","color":"white"}]

# --- Tier 4 Perk ---
execute if score @s ms.t4_perk matches 0 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"—","color":"gray"}]
# Warrior T4
execute if score @s ms.class matches 1 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Adrenaline Rush","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Barbaric Training","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Calloused Veteran","color":"white"}]
# Rogue T4
execute if score @s ms.class matches 2 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Mark of Sacrifice","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Backstab","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Nightfall","color":"white"}]
# Ranger T4
execute if score @s ms.class matches 3 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Survival Instincts","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Hawkeye","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Disengage","color":"white"}]
# Mage T4
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 1 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Zeus","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 2 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Bodyguard","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t4_perk matches 3 run tellraw @s [{"text":" T4: ","color":"gold"},{"text":"Blink","color":"white"}]

# --- Tier 5 Perk ---
execute if score @s ms.t5_perk matches 0 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"—","color":"gray"}]
# Warrior T5
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Avernus","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Tough as Nails","color":"white"}]
execute if score @s ms.class matches 1 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Impenetrable Wall","color":"white"}]
# Rogue T5
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Cheat Death","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Shinobi","color":"white"}]
execute if score @s ms.class matches 2 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Into Thin Air","color":"white"}]
# Ranger T5
execute if score @s ms.class matches 3 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Sniper Elite","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Doom","color":"white"}]
execute if score @s ms.class matches 3 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Beast Mastery","color":"white"}]
# Mage T5
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 1 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Armageddon","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 2 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Acheron","color":"white"}]
execute if score @s ms.class matches 4 if score @s ms.t5_perk matches 3 run tellraw @s [{"text":" T5: ","color":"gold"},{"text":"Fountain of Youth","color":"white"}]

# Footer
tellraw @s {"text":"══════════════════════","color":"gold","bold":true}
