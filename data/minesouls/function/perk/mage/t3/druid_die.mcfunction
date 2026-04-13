# Druid Die – Death effects and cleanup for a druid wolf.
# Runs as the druid wolf, at the wolf's position.

# Death effects
particle minecraft:smoke ~ ~0.5 ~ 0.3 0.3 0.3 0.05 10
playsound minecraft:entity.wolf.death player @a[distance=..16] ~ ~ ~ 1 1

# Kill self
kill @s
