# Grant "Escaping Samsara" achievement and reward 5 Ender Eyes.
# The Ender Eyes are only given to the FIRST player to reach 1M blocks – subsequent
# victors still earn the achievement announcement but receive no item reward.
# Called from bonfire/rest.mcfunction after verifying the player hasn't earned it yet.
advancement grant @s only minesouls:achievement/escaping_samsara
execute unless score #samsara ms.first_reward matches 1.. run give @s minecraft:ender_eye 5
scoreboard players set #samsara ms.first_reward 1
