# Grant "Marathoner" achievement and reward 1 Ender Eye.
# The Ender Eye is only given to the FIRST player to reach 100k blocks – subsequent
# victors still earn the achievement announcement but receive no item reward.
# Called from bonfire/rest.mcfunction after verifying the player hasn't earned it yet.

# Atomically claim the first-recipient slot: increment the global counter and
# give the reward only when the result is exactly 1 (this player was first).
scoreboard players add #marathoner ms.first_reward 1
execute if score #marathoner ms.first_reward matches 1 run give @s minecraft:ender_eye 1
advancement grant @s only minesouls:achievement/marathoner
tag @s add ms.ach.marathoner
