# Knight Artorias – Despawn function
# Called when no player is within 60 blocks.
# Teleports the boss deep into the void (no kill credit / no achievement).
# Runs as the base entity (vindicator) at its position.

# Hide bossbar immediately
bossbar set minesouls:artorias visible false

# Clear alive flag BEFORE teleporting so the death-detection in tick.mcfunction
# knows this was a despawn, not a player kill.
scoreboard players set #global ms.arta_alive 0

# Kill the armor stand so it doesn't orphan in the world
kill @e[type=armor_stand,tag=ms_artorias_stand]

# Teleport base entity to void — it will be cleaned up by the server or next reload.
tp @s ~ ~-500 ~
