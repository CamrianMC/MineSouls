# This function runs once when the datapack is loaded
# Add your initialization commands here

tellraw @a {"text":"MineSouls datapack loaded!","color":"green"}

# Estus Flask scoreboard: tracks the number of uses on the flask currently
# held by each player (used to preserve the count across the consumption tick)
scoreboard objectives add ms.estus_uses dummy

# Bonfire rest scoreboards
scoreboard objectives add ms.bonfire_rest dummy
scoreboard objectives add ms.bonfire_x dummy
scoreboard objectives add ms.bonfire_y dummy
scoreboard objectives add ms.bonfire_z dummy
scoreboard objectives add ms.bonfire_dim dummy
scoreboard objectives add ms.has_bonfire dummy

# Respawn-teleport scoreboards
scoreboard objectives add ms.deaths minecraft.custom:minecraft.deaths
scoreboard objectives add ms.prev_deaths dummy
scoreboard objectives add ms.pending_tp dummy
scoreboard objectives add ms.initialized dummy

# Darksign scoreboards
scoreboard objectives add ms.darksign_clicks dummy
scoreboard objectives add ms.darksign_timer dummy
scoreboard objectives add ms.spawn_x dummy
scoreboard objectives add ms.spawn_y dummy
scoreboard objectives add ms.spawn_z dummy

# Flask of Wondrous Physik scoreboards
scoreboard objectives add ms.physik_type dummy
scoreboard objectives add ms.physik_cycle_timer dummy
scoreboard objectives add ms.physik_count dummy
