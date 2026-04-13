# Goyim Die – Death effects and cleanup for the goyim villager.
# Runs as the goyim villager, at the goyim's position.

# Death effects
particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.1 20
playsound minecraft:entity.villager.death player @a[distance=..16] ~ ~ ~ 1 1

# Kill self
kill @s
