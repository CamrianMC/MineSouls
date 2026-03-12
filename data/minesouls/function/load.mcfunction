# This function runs once when the datapack is loaded
# Add your initialization commands here

tellraw @a {"text":"MineSouls datapack loaded!","color":"green"}

# Estus Flask scoreboard: tracks the number of uses on the flask currently
# held by each player (used to preserve the count across the consumption tick)
scoreboard objectives add ms.estus_uses dummy
