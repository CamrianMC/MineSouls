# Cap check: count existing humanities within 100 blocks; skip conversion if at or above limit
scoreboard players set #dw_count ms.dw_temp 0
execute as @e[tag=ms_living_humanity,distance=..100] run scoreboard players add #dw_count ms.dw_temp 1

execute unless score #dw_count ms.dw_temp matches 8.. run summon zombie ~ ~ ~ {Silent:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Health:20f,IsBaby:0b,CanBreakDoors:0b,DrownedConversionTime:2147483647,Tags:["ms_living_humanity"],CustomName:{"shadow_color":-5636096,"text":"Living Humanity"},active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:1b}],attributes:[{id:"minecraft:follow_range",base:48},{id:"minecraft:movement_speed",base:0.1},{id:"minecraft:spawn_reinforcements",base:0}]}

tp @s ~ ~-300 ~
kill @s