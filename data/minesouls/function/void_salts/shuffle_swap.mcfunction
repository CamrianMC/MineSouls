# Void Salts: Perform a single inventory swap using macro arguments
# Arguments: src (int), dst (int) - inventory slot indices
# Spawns a temporary item_display to hold one item during the swap
$execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:["ms_void_swap"]}
$execute at @s run item replace entity @e[type=minecraft:item_display,tag=ms_void_swap,distance=..2,limit=1] contents from entity @s container.$(src)
$item replace entity @s container.$(src) from entity @s container.$(dst)
$execute at @s run item replace entity @s container.$(dst) from entity @e[type=minecraft:item_display,tag=ms_void_swap,distance=..2,limit=1] contents
$execute at @s run kill @e[type=minecraft:item_display,tag=ms_void_swap,distance=..2,limit=1]

