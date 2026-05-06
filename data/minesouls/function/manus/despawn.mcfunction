# Despawn – called when no player is within 50 blocks of Manus.
# Kills Manus directly; this is cleaner than teleporting to an unloaded chunk because
# wardens have PersistenceRequired:1b set and would not naturally despawn after a teleport.
# Runs as Manus at Manus.

# Remove the boss health bar before Manus leaves
bossbar remove minesouls:manus

# Clear the alive flag BEFORE teleporting away so the death-detection logic in
# tick.mcfunction knows this entity disappearance was a despawn, not a kill.
scoreboard players set #global ms.manus_alive 0

tp @s ~ ~-300 ~
