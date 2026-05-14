# Grant "Escaping Samsara" achievement and reward 5 Ender Eyes.
# The Ender Eyes are only given to the FIRST player to reach 1M blocks – subsequent
# victors still earn the achievement announcement but receive no item reward.
# Called from bonfire/rest.mcfunction after verifying the player hasn't earned it yet.

# Atomically claim the first-recipient slot: increment the global counter and
# give the reward only when the result is exactly 1 (this player was first).
scoreboard players add #samsara ms.first_reward 1
execute if score #samsara ms.first_reward matches 1 run give @s minecraft:ender_eye 5
advancement grant @s only minesouls:achievement/escaping_samsara
tag @s add ms.ach.escaping_samsara
