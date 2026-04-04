# Goyim Tick – Per-entity tick for the goyim villager.
# Attracts all hostile mobs within 20 blocks toward it.
# Runs as the goyim villager, at the goyim's position.

# Tag self for targeting reference
tag @s add ms_goyim_target

# Pull each hostile mob 0.15 blocks toward this goyim every tick (~3 blocks/sec)
execute as @e[type=#minesouls:hostile,distance=..20] at @s facing entity @e[tag=ms_goyim_target,limit=1] feet positioned ^ ^ ^0.15 run tp @s ~ ~ ~

# Cleanup target tag
tag @s remove ms_goyim_target
