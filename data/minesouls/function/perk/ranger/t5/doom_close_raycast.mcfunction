# Doom – Recursive close-range raycast step (0.5 blocks per call).
# Runs as the Ranger, at the current ray position, with the Ranger's look rotation.
# Stops on: max range (5 blocks), solid block, or entity hit.

# Max range: 5 blocks = 10 steps at 0.5 blocks each
execute if score @s ms.doom_steps matches 10.. run return 0

# Block collision: stop if the ray hits a non-passable block
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air unless block ~ ~ ~ minecraft:water unless block ~ ~ ~ minecraft:lava run return 0

# Entity check: look for a hittable entity within 2 blocks
execute if entity @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,distance=..2,limit=1] run return run function minesouls:perk/ranger/t5/doom_close_hit

# Increment step counter and recurse
scoreboard players add @s ms.doom_steps 1
execute positioned ^ ^ ^0.5 run function minesouls:perk/ranger/t5/doom_close_raycast
