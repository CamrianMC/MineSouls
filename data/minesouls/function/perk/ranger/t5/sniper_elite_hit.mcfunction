# Sniper Elite – Hitscan hit handler.
# Runs at the raycast impact position, as the Ranger.
# Deals 9 damage (equivalent to a fully charged bow) to the first entity hit.

# Tag the nearest hittable entity
tag @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,distance=..0.7,sort=nearest,limit=1] add ms_se_target

# Bail if no target (shouldn't happen but safety check)
execute unless entity @e[tag=ms_se_target,limit=1] run return 0

# Deal 9 damage (fully charged arrow equivalent) attributed to the Ranger
damage @e[tag=ms_se_target,limit=1] 9 minecraft:arrow by @s

# Impact effects
execute at @e[tag=ms_se_target,limit=1] run particle minecraft:crit ~ ~1 ~ 0.3 0.5 0.3 0.2 20
playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1.5

# Cleanup
tag @e[tag=ms_se_target] remove ms_se_target
