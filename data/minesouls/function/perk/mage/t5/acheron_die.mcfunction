# Acheron Die – Death effects and cleanup for the acheron wither.
# Runs as the wither, at the wither's position.

# Death effects
particle minecraft:soul_fire_flame ~ ~1 ~ 1.0 1.0 1.0 0.1 30
particle minecraft:smoke ~ ~1 ~ 0.5 0.5 0.5 0.05 15
playsound minecraft:entity.wither.death player @a[distance=..64] ~ ~ ~ 1 1

# Kill self
kill @s
