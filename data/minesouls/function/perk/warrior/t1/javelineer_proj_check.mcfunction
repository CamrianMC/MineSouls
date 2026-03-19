# Javelineer – Snowball/Egg proximity check
# Runs as and at a tagged snowball or egg with ms_jav_ready.
# If the projectile is within 1.5 blocks of a damageable entity, deal 2 bonus damage.

# Temporarily tag the thrower so they are excluded from damage
execute on origin run tag @s add ms_jav_owner

# Tag the nearest valid target within 1.5 blocks
tag @e[distance=..1.5,tag=!ms_jav_owner,tag=!ms_jav_proj,type=!item,type=!marker,type=!area_effect_cloud,type=!experience_orb,sort=nearest,limit=1] add ms_jav_target

# If a target was found, deal 2 damage and mark this projectile as hit
execute if entity @e[tag=ms_jav_target,limit=1] run damage @e[tag=ms_jav_target,limit=1] 2 minecraft:thrown
execute if entity @e[tag=ms_jav_target,limit=1] run tag @s add ms_jav_hit

# Clean up target tag
tag @e[tag=ms_jav_target] remove ms_jav_target

# Clean up thrower tag
execute on origin run tag @s remove ms_jav_owner
