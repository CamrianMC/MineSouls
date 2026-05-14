# Spawn a Darkwraith skeleton in place of any hostile mob in the Abyss, then remove the original.
# Called via: execute as @e[type=#minesouls:hostile,...,tag=!ms_darkwraith,predicate=minesouls:in_abyss] at @s run function minesouls:darkwraith/init

# Cap check: count existing Darkwraiths within 100 blocks; skip conversion if at or above limit
scoreboard players set #dw_count ms.dw_temp 0
execute as @e[tag=ms_darkwraith,distance=..100] run scoreboard players add #dw_count ms.dw_temp 1

# Under cap: summon Darkwraith replacement (CustomNameVisible:0b = name only appears on direct crosshair, not through walls)
execute unless score #dw_count ms.dw_temp matches 8.. run summon skeleton ~ ~ ~ {Silent:1b,CustomNameVisible:0b,DeathLootTable:"minecraft:empty",CanPickUpLoot:0b,Health:50f,Tags:["ms_darkwraith"],CustomName:{"color":"dark_red","text":"Darkwraith"},equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:dyed_color":1908001,"minecraft:trim":{material:"minecraft:iron",pattern:"minecraft:rib"}}},legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":1908001,"minecraft:trim":{material:"minecraft:iron",pattern:"minecraft:rib"}}},chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":1908001,"minecraft:trim":{material:"minecraft:iron",pattern:"minecraft:rib"}}},head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":1908001,"minecraft:trim":{material:"minecraft:iron",pattern:"minecraft:rib"}}},mainhand:{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{"sharpness":5}}}},drop_chances:{feet:0.000,legs:0.000,chest:0.000,head:0.000,mainhand:0.000},attributes:[{id:"minecraft:follow_range",base:16},{id:"minecraft:max_health",base:30}]}

# Remove the original mob regardless (tp sends loot below min_y where items are destroyed)
tp @s ~ ~-300 ~
kill @s
