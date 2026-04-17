# Doom – Close-range bonus damage handler.
# Runs at the raycast impact position, as the Ranger.
# Deals bonus damage for the 4 spray arrows that hit simultaneously but dealt no
# damage due to MC Java's arrow immunity frames.
# Bonus = 4 extra arrows × 6 damage each = 24 damage.

# Tag the nearest hittable entity
tag @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,distance=..0.7,sort=nearest,limit=1] add ms_doom_target

# Bail if no target (safety check)
execute unless entity @e[tag=ms_doom_target,limit=1] run return 0

# Deal 24 bonus damage (4 arrows × 6 damage) attributed to the Ranger
damage @e[tag=ms_doom_target,limit=1] 24 minecraft:arrow by @s

# Impact effects
execute at @e[tag=ms_doom_target,limit=1] run particle minecraft:crit ~ ~1 ~ 0.3 0.5 0.3 0.2 20
playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 0.8

# Cleanup
tag @e[tag=ms_doom_target] remove ms_doom_target
