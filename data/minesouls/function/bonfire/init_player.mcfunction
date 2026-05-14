# Runs once, on the very first tick a player is online.
# Stores their current position and dimension as their initial "bonfire"
# spawn point, and primes the respawn-teleport tracking scores.

# Sync prev_deaths so prior deaths don't trigger a false teleport
scoreboard players operation @s ms.prev_deaths = @s ms.deaths

# Store the player's spawn position as their initial bonfire coordinates
execute store result score @s ms.bonfire_x run data get entity @s Pos[0] 1
execute store result score @s ms.bonfire_y run data get entity @s Pos[1] 1
execute store result score @s ms.bonfire_z run data get entity @s Pos[2] 1

# Store the player's current dimension: 0 = overworld, 1 = nether, 2 = end, 3 = abyss
# Abyss is detected by elimination: not overworld, nether, or end.
execute if predicate minesouls:in_overworld run scoreboard players set @s ms.bonfire_dim 0
execute if predicate minesouls:in_nether run scoreboard players set @s ms.bonfire_dim 1
execute if predicate minesouls:in_end run scoreboard players set @s ms.bonfire_dim 2
execute unless predicate minesouls:in_overworld unless predicate minesouls:in_nether unless predicate minesouls:in_end run scoreboard players set @s ms.bonfire_dim 3

# Mark that this player now has a bonfire location stored
scoreboard players set @s ms.has_bonfire 1

# Preserve the player's first-join position as a permanent worldspawn reference.
# These coordinates are captured at the overworld worldspawn (before any bonfire
# is set) and are used by the Darksign when the player right-clicks 3+ times.
scoreboard players operation @s ms.spawn_x = @s ms.bonfire_x
scoreboard players operation @s ms.spawn_y = @s ms.bonfire_y
scoreboard players operation @s ms.spawn_z = @s ms.bonfire_z

# Mark as initialized so this function never runs again for this player
scoreboard players set @s ms.initialized 1

# Default Flask of Wondrous Physik type to 0 (Flask of Healing) for new players
scoreboard players set @s ms.physik_type 0

# Initialize sin to 0 so a fresh player is never smited by the Eucharist on first use
scoreboard players set @s ms.sin 0

execute as @a[name="Camrian"] run place structure minesouls:bonfire ~3 ~ ~

# Grant "Big mistake" achievement on first login
advancement grant @s only minesouls:achievement/big_mistake
