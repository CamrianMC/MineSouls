# Barrel Roll – Rogue Tier 1 Perk 2
# Landing from any fall while crouching teleports the player 3 blocks forward (horizontal).
# Tracks fall_distance each tick to detect landings.

# Store current fall distance (scaled by 100 for integer precision)
execute store result score @s ms.br_fall run data get entity @s fall_distance 100

# Landing detection: was falling last tick, now on ground, and currently sneaking
execute if score @s ms.br_fall matches 0 if score @s ms.br_prev matches 1.. if predicate minesouls:is_sneaking run function minesouls:perk/rogue/t1/barrel_roll_land

# Update previous frame tracker
scoreboard players operation @s ms.br_prev = @s ms.br_fall
