# Disengage – Activation handler
# Cancels downward momentum, launches player backwards and slightly upward.
# Consumes 2 hunger points and starts a 20-tick (1 second) cooldown.

# Cancel fall distance so landing doesn't deal damage
data modify entity @s fall_distance set value 0

# Cancel downward velocity and launch backwards + slightly up
# ^ ^ ^ is relative to facing: ^0 = right, ^0.4 = up, ^-1.5 = backward
# We need to set Motion directly: zero downward, push backwards relative to facing
# Use tp-based approach: teleport to cancel velocity, then apply backwards motion via marker trick

# Step 1: Summon a marker 2.5 blocks behind the player (and 0.4 blocks up)
execute rotated ~ 0 run summon minecraft:marker ^ ^ ^-2.5 {Tags:["ms_dis_target"]}
execute run summon minecraft:marker ~ ~0.4 ~ {Tags:["ms_dis_origin"]}

# Step 2: Get direction vector (target - origin) scaled for Motion
execute store result score #dis_tx ms.arrow_temp run data get entity @e[tag=ms_dis_target,limit=1] Pos[0] 10000
execute store result score #dis_ty ms.arrow_temp run data get entity @e[tag=ms_dis_target,limit=1] Pos[1] 10000
execute store result score #dis_tz ms.arrow_temp run data get entity @e[tag=ms_dis_target,limit=1] Pos[2] 10000

execute store result score #dis_ox ms.arrow_temp run data get entity @e[tag=ms_dis_origin,limit=1] Pos[0] 10000
execute store result score #dis_oy ms.arrow_temp run data get entity @e[tag=ms_dis_origin,limit=1] Pos[1] 10000
execute store result score #dis_oz ms.arrow_temp run data get entity @e[tag=ms_dis_origin,limit=1] Pos[2] 10000

# Direction = target - origin
scoreboard players operation #dis_tx ms.arrow_temp -= #dis_ox ms.arrow_temp
scoreboard players operation #dis_ty ms.arrow_temp -= #dis_oy ms.arrow_temp
scoreboard players operation #dis_tz ms.arrow_temp -= #dis_oz ms.arrow_temp

# Apply motion to the player: scale 0.00004 gives ~0.4-1.0 blocks/tick horizontal speed
# For 2.5 block direction vector: 2.5 * 10000 * 0.00004 = 1.0 blocks/tick
execute store result entity @s Motion[0] double 0.00004 run scoreboard players get #dis_tx ms.arrow_temp
execute store result entity @s Motion[1] double 0.00004 run scoreboard players get #dis_ty ms.arrow_temp
execute store result entity @s Motion[2] double 0.00004 run scoreboard players get #dis_tz ms.arrow_temp

# Clean up markers
kill @e[tag=ms_dis_target]
kill @e[tag=ms_dis_origin]

# Consume 2 hunger points (hunger effect for 1 tick at amplifier 59 = instant 2-point drain)
effect give @s minecraft:hunger 2 29 true

# Set cooldown (20 ticks = 1 second)
scoreboard players set @s ms.dis_cd 20

# Visual and audio feedback
playsound minecraft:entity.ender_dragon.flap player @s ~ ~ ~ 0.8 1.5
particle minecraft:cloud ~ ~ ~ 0.3 0.1 0.3 0.05 15
