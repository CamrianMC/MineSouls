# Grant "Marathoner" achievement and reward 1 Ender Eye.
# The Ender Eye is only given to the FIRST player to reach 100k blocks – subsequent
# victors still earn the achievement announcement but receive no item reward.
# Called from bonfire/rest.mcfunction after verifying the player hasn't earned it yet.
advancement grant @s only minesouls:achievement/marathoner
execute unless score #marathoner ms.first_reward matches 1.. run give @s minecraft:ender_eye 1
scoreboard players set #marathoner ms.first_reward 1
