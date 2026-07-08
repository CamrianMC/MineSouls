# Reward function for minesouls:void_salts/consumed advancement.
# Runs as the player who just consumed Void Salts.
# Picks one of 9 random effects.

# Allow the advancement to trigger again on the next use
advancement revoke @s only minesouls:void_salts/consumed

# Generate a random number 1-9 using the random command
execute store result score @s ms.void_salts_roll run random value 1..9

# Effect 1: 30 seconds of Nausea and Darkness
execute if score @s ms.void_salts_roll matches 1 run function minesouls:void_salts/effect_nausea

# Effect 2: Rains Chickens for 10 seconds
execute if score @s ms.void_salts_roll matches 2 run function minesouls:void_salts/effect_chickens

# Effect 3: Random teleport within 50,000 blocks
execute if score @s ms.void_salts_roll matches 3 run function minesouls:void_salts/effect_teleport

# Effect 4: 30 xp levels
execute if score @s ms.void_salts_roll matches 4 run function minesouls:void_salts/effect_xp

# Effect 5: Hunger 255 for 15 seconds
execute if score @s ms.void_salts_roll matches 5 run function minesouls:void_salts/effect_hunger

# Effect 6: Jump Boost 255 and Speed 255 for 15 seconds
execute if score @s ms.void_salts_roll matches 6 run function minesouls:void_salts/effect_launch

# Effect 7: Summon a charged Creeper 1 block in front
execute if score @s ms.void_salts_roll matches 7 run function minesouls:void_salts/effect_creeper

# Effect 8: Monster noises over 30 seconds
execute if score @s ms.void_salts_roll matches 8 run function minesouls:void_salts/effect_noises

# Effect 9: Shuffle inventory items
execute if score @s ms.void_salts_roll matches 9 run function minesouls:void_salts/effect_shuffle
