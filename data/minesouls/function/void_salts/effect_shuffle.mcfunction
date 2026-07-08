# Void Salts Effect 9: Randomly shuffle inventory items
# tellraw @s {"text":"Your belongings rearrange themselves...","color":"dark_purple","italic":true}
execute at @s run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5

# Perform 18 random slot swaps to thoroughly shuffle the inventory
scoreboard players set @s ms.void_salts_swaps 18
function minesouls:void_salts/shuffle_loop
