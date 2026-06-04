# Explosive Shot – Ranger Tier 2 Perk 2
# Arrows trigger a small explosion on impact.
# Does not inflict damage to other players or terrain.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t2/explosive_shot

# Tag the nearest hurt non-player entity as the impact point
tag @e[type=!minecraft:player,sort=nearest,distance=..64,limit=1] add ms_explosive_target

# Visual explosion effect and AoE damage at the tagged entity
execute at @e[tag=ms_explosive_target,limit=1] run particle minecraft:explosion ~ ~0.5 ~ 1 1 1 0.1 5
execute at @e[tag=ms_explosive_target,limit=1] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1.2
execute at @e[tag=ms_explosive_target,limit=1] as @e[type=!item,type=!minecraft:player,tag=!ms_explosive_target,distance=..10,limit=10] run damage @s 3 minecraft:explosion by @p

# Clean up
tag @e[tag=ms_explosive_target] remove ms_explosive_target