# Floydster achievement: detect suffocation death.
# Runs as each player every tick, before bonfire/on_respawn syncs prev_deaths.

# Flag when at ≤1 heart with a block at head level
execute if score @s ms.health matches 1..2 at @s unless block ~ ~1 ~ minecraft:air run tag @s add ms_suffocating

# Clear the flag if the block at head level is gone (escaped or teleported away)
execute at @s if block ~ ~1 ~ minecraft:air run tag @s remove ms_suffocating

# On death: if the flag is set, the player died from suffocation – grant achievement
execute if score @s ms.deaths > @s ms.prev_deaths if entity @s[tag=ms_suffocating] run advancement grant @s only minesouls:achievement/floydster

# Always clear the flag on death (whether achievement was granted or not)
execute if score @s ms.deaths > @s ms.prev_deaths run tag @s remove ms_suffocating
