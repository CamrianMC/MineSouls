# Sniper Elite – Recursive raycast step (0.5 blocks per call).
# Runs as the Ranger, at the current ray position, with the Ranger's look rotation.
# Stops on: max range (64 blocks), solid block, or entity hit.

# Max range: 64 blocks = 128 steps at 0.5 blocks each
execute if score @s ms.se_steps matches 128.. run return 0

# Block collision: stop if the ray hits a non-passable block
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air unless block ~ ~ ~ minecraft:water unless block ~ ~ ~ minecraft:lava run return 0

# Entity check: look for a hittable entity within 0.7 blocks
# Exclude non-living entity types (items, XP orbs, markers, arrows, displays, etc.)
execute if entity @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,distance=..0.7,limit=1] run return run function minesouls:perk/ranger/t5/sniper_elite_hit

# Tracer particle every other step
execute if score @s ms.se_steps matches 0..127 run particle minecraft:crit ~ ~ ~ 0 0 0 0 1

# Increment step counter and recurse
scoreboard players add @s ms.se_steps 1
execute positioned ^ ^ ^0.5 run function minesouls:perk/ranger/t5/sniper_elite_raycast
