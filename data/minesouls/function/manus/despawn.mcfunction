# Despawn – called when no player is within 50 blocks of Manus.
# Kills Manus directly; this is cleaner than teleporting to an unloaded chunk because
# wardens have PersistenceRequired:1b set and would not naturally despawn after a teleport.
# Runs as Manus at Manus.

# Announce the retreat to any players in the Abyss
tellraw @a {"text":"The darkness recedes...","color":"dark_purple"}

# Death audio at Manus' last known position
playsound minecraft:entity.warden.death hostile @a ~ ~ ~ 1 0.7

# Remove Manus
kill @s
