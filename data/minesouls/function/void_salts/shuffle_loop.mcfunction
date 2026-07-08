# Void Salts: Shuffle loop - performs one random swap per call, then recurses
# Decrements ms.void_salts_swaps each iteration until 0

# Pick two random inventory slots (0-35 maps to container.0-35 which covers full inventory)
execute store result score @s ms.void_salts_src run random value 0..35
execute store result score @s ms.void_salts_dst run random value 0..35

# Store source item in storage, copy dest to source, then storage to dest
execute store result storage minesouls:void_salts swap.src int 1 run scoreboard players get @s ms.void_salts_src
execute store result storage minesouls:void_salts swap.dst int 1 run scoreboard players get @s ms.void_salts_dst
function minesouls:void_salts/shuffle_swap with storage minesouls:void_salts swap

# Decrement counter
scoreboard players remove @s ms.void_salts_swaps 1

# Recurse if swaps remain
execute if score @s ms.void_salts_swaps matches 1.. run function minesouls:void_salts/shuffle_loop
