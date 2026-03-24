# Into Thin Air – Attack Detected
# Fires when the player hits any entity (melee or ranged).
# Disables invisibility for 10 seconds (200 ticks).

# Revoke advancement so it can re-trigger
advancement revoke @s only minesouls:perk/rogue/t5/into_thin_air

# Disable invisibility for 10 seconds
scoreboard players set @s ms.ita_disable 200
