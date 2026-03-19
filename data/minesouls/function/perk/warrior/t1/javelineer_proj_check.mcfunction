# Javelineer – Snowball/Egg proximity check
# Runs as and at a tagged snowball or egg with ms_jav_ready.
# If the projectile is within 1.5 blocks of a damageable entity, deal 2 bonus damage.

# Temporarily tag the thrower so they are excluded from damage
execute on origin run tag @s add ms_jav_owner

# Deal 2 damage to the nearest valid target within 1.5 blocks
damage @e[distance=..1.5,tag=!ms_jav_owner,tag=!ms_jav_proj,type=!item,type=!marker,type=!area_effect_cloud,type=!experience_orb,sort=nearest,limit=1] 2 minecraft:thrown

# Mark this projectile as hit if a target was found (prevent re-triggering)
execute if entity @e[distance=..1.5,tag=!ms_jav_owner,tag=!ms_jav_proj,type=!item,type=!marker,type=!area_effect_cloud,type=!experience_orb,limit=1] run tag @s add ms_jav_hit

# Clean up thrower tag
execute on origin run tag @s remove ms_jav_owner
