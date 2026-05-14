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

# ── Sif despawn ──────────────────────────────────────────────────────────────
# Sif was summoned as a companion for this fight; when all players die and Manus
# despawns she leaves the same way.
execute as @e[type=minecraft:wolf,tag=ms_sif] run tp @s ~ ~-300 ~

# Remove the sword armor stand immediately (no need to send it underground)
kill @e[type=minecraft:armor_stand,tag=ms_sif_sword]

# Release players from the alliance team so future sessions start clean
team leave @a[team=ms_sif_alliance]

