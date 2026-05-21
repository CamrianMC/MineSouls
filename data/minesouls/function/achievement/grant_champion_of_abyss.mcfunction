# Grant "Champion of the Abyss" to all online players when Knight Artorias is killed.
# Also resets the alive flag so this fires only once per kill.
# Called from tick.mcfunction when the ms_artorias entity is gone and ms.arta_alive = 1.

# Reset alive flag immediately to prevent re-firing every tick
scoreboard players set #global ms.arta_alive 0

# Unlock the Abyss globally — only one player needs this achievement
scoreboard players set #global ms.abyss_unlocked 1

# Grant advancement and tag to every online player
advancement grant @a only minesouls:achievement/champion_of_the_abyss
tag @a add ms.ach.champion_of_the_abyss

# Drop the Greatsword of Artorias to every online player
give @a minecraft:netherite_sword[minecraft:custom_name={"text":"Greatsword of Artorias","italic":false,"color":"gold"},minecraft:lore=[{"text":"Greatsword once wielded by one of the Four Knights of Gwyn.","italic":true,"color":"gray"},{"text":"Pierce the oppressive darkness of the Abyss.","italic":false,"color":"dark_purple"}],minecraft:custom_data={minesouls:{greatsword_of_artorias:true}},minecraft:enchantments={"minecraft:sharpness":5},minecraft:unbreakable={},minecraft:max_stack_size=1] 1
