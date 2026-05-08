# Called every tick for each online player.
# Detects when a player dies and, after they click Respawn, teleports them to
# their stored bonfire coordinates (simulating the bonfire as their spawn point).

# On the first tick after joining, run one-time player initialisation:
# stores spawn coords as their initial bonfire location and primes death tracking.
execute unless score @s ms.initialized matches 1 run function minesouls:bonfire/init_player

# Warrior T4 Perk Calloused Veteran: Reapply if player has died
execute as @a[scores={ms.class=1,ms.t4_perk=3}] if score @s ms.deaths > @s ms.prev_deaths run tag @s remove ms_calloused_active

# If the death count has increased since the last check, flag this player for
# a bonfire teleport and sync the counter; otherwise no action is needed.
execute if score @s ms.deaths > @s ms.prev_deaths run scoreboard players set @s ms.pending_tp 1
# Cancel any active Darksign countdown when the player dies
execute if score @s ms.deaths > @s ms.prev_deaths run scoreboard players set @s ms.darksign_timer 0
execute if score @s ms.deaths > @s ms.prev_deaths run scoreboard players set @s ms.darksign_clicks 0
execute if score @s ms.deaths > @s ms.prev_deaths run scoreboard players set @s ms.darksign_low_hp 0
execute if score @s ms.deaths > @s ms.prev_deaths run scoreboard players operation @s ms.prev_deaths = @s ms.deaths

# Once the player is alive again (Health > 0, i.e. they clicked Respawn) and
# they have a bonfire stored, teleport them there and clear the pending flag.
execute if score @s ms.pending_tp matches 1 if score @s ms.has_bonfire matches 1 if entity @s[predicate=minesouls:is_alive] run function minesouls:bonfire/teleport_home
execute if score @s ms.pending_tp matches 1 if entity @s[predicate=minesouls:is_alive] run scoreboard players set @s ms.pending_tp 0

