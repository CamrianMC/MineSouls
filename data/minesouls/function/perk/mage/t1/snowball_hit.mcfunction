# Snowball Hit – Apply damage at the snowball impact point.
# Runs as the orphaned marker, at the marker's position (impact point).
# Deals 2 damage to the nearest hittable entity within 1.5 blocks.

# Find and damage the nearest entity (excluding non-targetable types)
damage @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,type=!minecraft:snowball,distance=..3,sort=nearest,limit=1] 2 minecraft:freeze by @a[scores={ms.class=4,ms.t1_perk=1},sort=nearest,limit=1]

# Impact effects
particle minecraft:item_snowball ~ ~ ~ 0.2 0.2 0.2 0.1 8
playsound minecraft:block.snow.break player @a[distance=..16] ~ ~ ~ 1 1
