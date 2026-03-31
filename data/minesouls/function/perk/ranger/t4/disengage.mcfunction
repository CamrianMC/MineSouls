# Disengage – Ranger Tier 4 Perk 3
# Crouching while falling performs a backwards horizontal jump and cancels downward momentum.
# Consumes 2 hunger points. 1-second cooldown (20 ticks).

# Decrement cooldown
execute if score @s ms.dis_cd matches 1.. run scoreboard players remove @s ms.dis_cd 1

# Store current fall distance (scaled by 100)
execute store result score @s ms.dis_fall run data get entity @s fall_distance 100

# Detect: currently falling (fall_distance > 0), just started sneaking, not on cooldown
execute unless score @s ms.dis_fall matches 1.. run tag @s remove ms_dis_sneaking
execute unless score @s ms.dis_fall matches 1.. run scoreboard players operation @s ms.dis_prev = @s ms.dis_fall
execute unless score @s ms.dis_fall matches 1.. run return 0

# Player is falling – check for crouch activation
execute if predicate minesouls:is_sneaking unless entity @s[tag=ms_dis_sneaking] unless score @s ms.dis_cd matches 1.. run function minesouls:perk/ranger/t4/disengage_activate

# Track sneaking state for next tick
execute if predicate minesouls:is_sneaking run tag @s add ms_dis_sneaking
execute unless predicate minesouls:is_sneaking run tag @s remove ms_dis_sneaking

# Update previous frame tracker
scoreboard players operation @s ms.dis_prev = @s ms.dis_fall
