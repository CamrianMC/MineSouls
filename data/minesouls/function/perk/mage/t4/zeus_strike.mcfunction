# Zeus Strike – Summon lightning at the raycast target position.
# Runs at the position where the raycast stopped.

# Summon lightning bolt
summon minecraft:lightning_bolt ~ ~ ~

# Additional damage to the nearest hostile within 3 blocks (to ensure the strike is impactful)
damage @e[type=#minesouls:hostile,distance=..3,sort=nearest,limit=1] 8 minecraft:lightning_bolt

# Visual feedback at impact point
particle minecraft:electric_spark ~ ~ ~ 0.5 0.5 0.5 0.1 15
