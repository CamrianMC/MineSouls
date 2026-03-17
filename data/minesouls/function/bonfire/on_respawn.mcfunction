# Called every tick for each online player.
# Detects when a player dies and, after they click Respawn, teleports them to
# their stored bonfire coordinates (simulating the bonfire as their spawn point).

# On the first tick after joining, sync prev_deaths to the current death count
# so that deaths accumulated in previous sessions do not trigger a false teleport.
execute unless score @s ms.initialized matches 1 run scoreboard players operation @s ms.prev_deaths = @s ms.deaths
execute unless score @s ms.initialized matches 1 run scoreboard players set @s ms.initialized 1

# If the death count has increased since the last check, flag this player for
# a bonfire teleport (they have just died or are on the respawn screen).
execute if score @s ms.deaths > @s ms.prev_deaths run scoreboard players set @s ms.pending_tp 1

# Always sync prev_deaths to the current death count for the next tick.
scoreboard players operation @s ms.prev_deaths = @s ms.deaths

# Once the player is alive again (Health > 0, i.e. they clicked Respawn) and
# they have a bonfire stored, teleport them there and clear the pending flag.
execute if score @s ms.pending_tp matches 1 if score @s ms.has_bonfire matches 1 unless entity @s[nbt={Health:0.0f}] run function minesouls:bonfire/teleport_home
execute if score @s ms.pending_tp matches 1 unless entity @s[nbt={Health:0.0f}] run scoreboard players set @s ms.pending_tp 0
