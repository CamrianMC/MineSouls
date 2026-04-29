# Acheron Die – Death effects and cleanup for the acheron wither.
# Runs as the wither, at the wither's position.

# Death effects
particle minecraft:soul_fire_flame ~ ~1 ~ 1.0 1.0 1.0 0.1 30
particle minecraft:smoke ~ ~1 ~ 0.5 0.5 0.5 0.05 15
playsound minecraft:entity.wither.death player @a[distance=..64] ~ ~ ~ 1 1

# Kill lure vex
kill @e[tag=ms_acheron_vex]

# Clean up unused wither skulls that may be left behind if the wither dies in a tight space
kill @e[type=minecraft:wither_skull]

# Kill self
tp @s ~ ~-200 ~
kill @s
