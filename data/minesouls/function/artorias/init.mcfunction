# Knight Artorias – Spawn function
# Run this function at the desired arena location to summon Knight Artorias.
# Spawns: (1) invisible vindicator logic-driver, (2) armoured armor-stand visual.

# --- Assign a unique spawn ID for entity linking ---
scoreboard players add #arta_next_id ms.arta_id 1

# --- Base entity: invisible vindicator (logic driver) ---
# 1000 HP, NoAI (all movement/AI handled by commands), silent, no loot.
summon minecraft:vindicator ~ ~ ~ {Silent:1b,PersistenceRequired:1b,CustomNameVisible:0b,DeathLootTable:"minecraft:empty",NoAI:1b,Health:1000f,Tags:["ms_artorias","ms_artorias_new"],attributes:[{id:"minecraft:max_health",base:1000.0},{id:"minecraft:follow_range",base:64.0}]}

# Initialise per-entity scoreboards on the freshly spawned entity
scoreboard players operation @e[tag=ms_artorias_new,limit=1] ms.arta_id = #arta_next_id ms.arta_id
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_state 0
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_timer 0
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_attack_cd 80
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_attack_choice 0
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_phase 1
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_temp 0
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_dist 99
scoreboard players set @e[tag=ms_artorias_new,limit=1] ms.arta_aura_timer 20

# Add to artorias team (blocks friendly-fire from own AoEs)
team join artorias @e[tag=ms_artorias_new,limit=1]

# Remove temporary spawn tag
tag @e[tag=ms_artorias_new] remove ms_artorias_new

# --- Visual entity: armor stand ---
# Netherite armour with lapis silence trim, netherite sword in mainhand.
# ShowArms:1b so the sword arm is rendered; Invisible:1b hides the stand body.
summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,ShowArms:1b,Silent:1b,PersistenceRequired:1b,CustomNameVisible:0b,DeathLootTable:"minecraft:empty",Tags:["ms_artorias_stand","ms_artorias_stand_new"],equipment:{head:{id:"minecraft:netherite_helmet",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},chest:{id:"minecraft:netherite_chestplate",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},legs:{id:"minecraft:netherite_leggings",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},feet:{id:"minecraft:netherite_boots",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},mainhand:{id:"minecraft:netherite_sword",count:1}},drop_chances:{head:0.0,chest:0.0,legs:0.0,feet:0.0,mainhand:0.0,offhand:0.0}}

# Link armor stand to base entity via shared ID
scoreboard players operation @e[tag=ms_artorias_stand_new,limit=1] ms.arta_id = #arta_next_id ms.arta_id

# Remove temporary spawn tag
tag @e[tag=ms_artorias_stand_new] remove ms_artorias_stand_new

# --- Bossbar: activate ---
bossbar set minesouls:artorias max 1000
bossbar set minesouls:artorias value 1000
bossbar set minesouls:artorias color blue
bossbar set minesouls:artorias players @a
bossbar set minesouls:artorias visible true

# --- Global alive flag ---
scoreboard players set #global ms.arta_alive 1

# --- Announce and play intro effects at spawn position ---
tellraw @a {"text":"...The Abyss stirs. A cursed knight rises from the darkness.","color":"dark_blue","bold":true}
execute at @e[tag=ms_artorias,limit=1] run playsound minecraft:entity.warden.roar hostile @a ~ ~ ~ 1 0.5
execute at @e[tag=ms_artorias,limit=1] run particle minecraft:soul_fire_flame ~ ~1 ~ 1.5 2.0 1.5 0.1 60 normal
execute at @e[tag=ms_artorias,limit=1] run particle minecraft:squid_ink ~ ~1 ~ 1.0 1.5 1.0 0.05 40 normal
