# Shinobi – Fall Damage Negation
# Fires when the player takes fall damage (via entity_hurt_player advancement).
# Restores health to pre-damage level, effectively negating the fall damage.

# Revoke advancement so it can re-trigger
advancement revoke @s only minesouls:perk/rogue/t5/shinobi

# Restore health to pre-fall-damage level
execute store result entity @s Health float 1 run scoreboard players get @s ms.shinobi_prev
