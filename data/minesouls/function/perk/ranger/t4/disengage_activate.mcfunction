# Disengage – Activation handler
# Cancels downward momentum, launches player backwards and slightly upward.
# Consumes 2 hunger points and starts a 20-tick (1 second) cooldown.

# Cancel fall distance so landing doesn't deal damage
data modify entity @s fall_distance set value 0

#tellraw @s {"text":"Disengage!","color":"aqua","bold":true}

# Teleport in place to cancel all existing momentum (especially downward)
tp @s ~ ~ ~

# Summon wind charge 3 blocks in front and ~0.5 above head so the explosion
# pushes more horizontally and less vertically
execute anchored eyes positioned ~ ~0.7 ~ run summon minecraft:wind_charge ^ ^ ^1 {Tags:["ms_dis_wind"],HasBeenShot:1b}

# Reference marker at the same raised height (wind charge aims here)
execute anchored eyes run summon minecraft:marker ~ ~0.7 ~ {Tags:["ms_dis_ref"]}

# Compute direction: reference (player) - wind charge
execute store result score #dis_wx ms.arrow_temp run data get entity @e[tag=ms_dis_wind,limit=1] Pos[0] 10000
execute store result score #dis_wy ms.arrow_temp run data get entity @e[tag=ms_dis_wind,limit=1] Pos[1] 10000
execute store result score #dis_wz ms.arrow_temp run data get entity @e[tag=ms_dis_wind,limit=1] Pos[2] 10000

execute store result score #dis_rx ms.arrow_temp run data get entity @e[tag=ms_dis_ref,limit=1] Pos[0] 10000
execute store result score #dis_ry ms.arrow_temp run data get entity @e[tag=ms_dis_ref,limit=1] Pos[1] 10000
execute store result score #dis_rz ms.arrow_temp run data get entity @e[tag=ms_dis_ref,limit=1] Pos[2] 10000

scoreboard players operation #dis_rx ms.arrow_temp -= #dis_wx ms.arrow_temp
scoreboard players operation #dis_ry ms.arrow_temp -= #dis_wy ms.arrow_temp
scoreboard players operation #dis_rz ms.arrow_temp -= #dis_wz ms.arrow_temp

# Set Motion on wind charge toward player (~0.6 blocks/tick for 3-block distance)
execute store result entity @e[tag=ms_dis_wind,limit=1] Motion[0] double 0.0002 run scoreboard players get #dis_rx ms.arrow_temp
execute store result entity @e[tag=ms_dis_wind,limit=1] Motion[1] double 0.0002 run scoreboard players get #dis_ry ms.arrow_temp
execute store result entity @e[tag=ms_dis_wind,limit=1] Motion[2] double 0.0002 run scoreboard players get #dis_rz ms.arrow_temp

# Clean up reference marker (wind charge will self-destruct on explosion)
kill @e[tag=ms_dis_ref]
tag @e[tag=ms_dis_wind] remove ms_dis_wind

# Consume 2 hunger points (hunger effect for 1 tick at amplifier 59 = instant 2-point drain)
effect give @s minecraft:regeneration 1 2 true
effect give @s minecraft:hunger 2 29 true

# Set cooldown (20 ticks = 1 second)
scoreboard players set @s ms.dis_cd 20

# Visual and audio feedback
playsound minecraft:entity.ender_dragon.flap player @s ~ ~ ~ 10 1.5
particle minecraft:cloud ~ ~ ~ 0.3 0.1 0.3 0.05 15
