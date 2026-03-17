# Runs once, on the very first tick a player is online.
# Stores their current position and dimension as their initial "bonfire"
# spawn point, and primes the respawn-teleport tracking scores.

# Sync prev_deaths so prior deaths don't trigger a false teleport
scoreboard players operation @s ms.prev_deaths = @s ms.deaths

# Store the player's spawn position as their initial bonfire coordinates
execute store result score @s ms.bonfire_x run data get entity @s Pos[0] 1
execute store result score @s ms.bonfire_y run data get entity @s Pos[1] 1
execute store result score @s ms.bonfire_z run data get entity @s Pos[2] 1

# Store the player's current dimension: 0 = overworld, 1 = nether, 2 = end
execute if predicate minesouls:in_overworld run scoreboard players set @s ms.bonfire_dim 0
execute if predicate minesouls:in_nether run scoreboard players set @s ms.bonfire_dim 1
execute if predicate minesouls:in_end run scoreboard players set @s ms.bonfire_dim 2

# Mark that this player now has a bonfire location stored
scoreboard players set @s ms.has_bonfire 1

# Mark as initialized so this function never runs again for this player
scoreboard players set @s ms.initialized 1
