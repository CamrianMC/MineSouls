# Despawn – called when no player is within 50 blocks of Manus.
# Kills Manus directly; this is cleaner than teleporting to an unloaded chunk because
# wardens have PersistenceRequired:1b set and would not naturally despawn after a teleport.
# Runs as Manus at Manus.

# Remove the boss health bar before Manus leaves
bossbar remove minesouls:manus

tp @s ~ ~-300 ~
