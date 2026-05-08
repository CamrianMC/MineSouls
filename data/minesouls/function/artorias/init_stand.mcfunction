# Knight Artorias – Armor Stand Failsafe
# Called from main/tick.mcfunction when the armor stand entity is missing.
# Re-summons the visual at the current base entity position.
# Runs as the base entity (vindicator) at its position.

summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,ShowArms:1b,Silent:1b,PersistenceRequired:1b,CustomNameVisible:0b,DeathLootTable:"minecraft:empty",Tags:["ms_artorias_stand","ms_artorias_stand_new"],equipment:{head:{id:"minecraft:netherite_helmet",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},chest:{id:"minecraft:netherite_chestplate",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},legs:{id:"minecraft:netherite_leggings",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},feet:{id:"minecraft:netherite_boots",count:1,components:{"minecraft:trim":{material:"minecraft:lapis",pattern:"minecraft:silence"}}},mainhand:{id:"minecraft:netherite_sword",count:1}},drop_chances:{head:0.0,chest:0.0,legs:0.0,feet:0.0,mainhand:0.0,offhand:0.0}}

# Re-link to this base entity via matching ID
scoreboard players operation @e[tag=ms_artorias_stand_new,limit=1] ms.arta_id = @s ms.arta_id

tag @e[tag=ms_artorias_stand_new] remove ms_artorias_stand_new
