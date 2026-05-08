# Grant "Hero of Oolacile" to all online players when Manus is killed.
# Also resets the manus_alive flag so this only fires once per kill.
# Called from tick.mcfunction when the ms_manus entity is gone and ms.manus_alive = 1.

# Reset the alive flag immediately to prevent re-firing every tick
scoreboard players set #global ms.manus_alive 0

# Announce and grant to every online player
advancement grant @a only minesouls:achievement/hero_of_oolacile
tag @a add ms.ach.hero_of_oolacile
