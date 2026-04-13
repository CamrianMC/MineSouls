# Bodyguard Die – Death effects and cleanup for a bodyguard iron golem.
# Runs as the iron golem, at the golem's position.

# Death effects
particle minecraft:smoke ~ ~1 ~ 0.5 0.5 0.5 0.05 15
playsound minecraft:entity.iron_golem.death player @a[distance=..16] ~ ~ ~ 1 1

# Kill self
kill @s
