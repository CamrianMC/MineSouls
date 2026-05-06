# Grant "Please touch grass" achievement and reward 20 Ender Eyes + 64 Enchanted Golden Apples.
# The reward is only given to the FIRST player to reach 10M blocks – subsequent
# victors still earn the achievement announcement but receive no item reward.
# Called from bonfire/rest.mcfunction after verifying the player hasn't earned it yet.

# Atomically claim the first-recipient slot: increment the global counter and
# give the reward only when the result is exactly 1 (this player was first).
scoreboard players add #grass ms.first_reward 1
execute if score #grass ms.first_reward matches 1 run give @s minecraft:ender_eye 20
execute if score #grass ms.first_reward matches 1 run give @s minecraft:enchanted_golden_apple 64
advancement grant @s only minesouls:achievement/please_touch_grass
