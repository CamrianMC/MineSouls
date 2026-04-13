# Frosty Die – Death effects and cleanup for the frosty snow golem.
# Runs as the frosty snow golem, at the golem's position.

# Death effects
particle minecraft:snowflake ~ ~1 ~ 0.3 0.3 0.3 0.1 20
playsound minecraft:entity.snow_golem.death player @a[distance=..16] ~ ~ ~ 1 1

# Kill self
kill @s
