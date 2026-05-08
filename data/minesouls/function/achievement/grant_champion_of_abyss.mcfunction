# Grant "Champion of the Abyss" to all online players when Knight Artorias is killed.
# Also resets the alive flag so this fires only once per kill.
# Called from tick.mcfunction when the ms_artorias entity is gone and ms.arta_alive = 1.

# Reset alive flag immediately to prevent re-firing every tick
scoreboard players set #global ms.arta_alive 0

# Grant advancement and tag to every online player
advancement grant @a only minesouls:achievement/champion_of_the_abyss
tag @a add ms.ach.champion_of_the_abyss
