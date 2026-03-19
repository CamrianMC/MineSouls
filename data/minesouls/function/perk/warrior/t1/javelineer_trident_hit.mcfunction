# Javelineer – Trident hit handler
# Runs as and at a tagged trident with DealtDamage:1b.
# Deals 2 bonus damage to the nearest entity at the trident's position.

damage @e[distance=..3,type=!item,type=!marker,type=!area_effect_cloud,type=!experience_orb,type=!trident,sort=nearest,limit=1] 2 minecraft:trident

# Mark as dealt so we don't re-trigger on this throw
tag @s remove ms_jav_proj
tag @s add ms_jav_dealt
