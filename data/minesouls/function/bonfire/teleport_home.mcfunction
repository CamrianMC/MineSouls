# Teleport the player to their stored bonfire coordinates.
# Reads ms.bonfire_x/y/z (block position) and ms.bonfire_dim (0=overworld, 1=nether, 2=end).

# Copy the stored bonfire coordinates into command storage for the macro
execute store result storage minesouls:bonfire tp.x int 1 run scoreboard players get @s ms.bonfire_x
execute store result storage minesouls:bonfire tp.y int 1 run scoreboard players get @s ms.bonfire_y
execute store result storage minesouls:bonfire tp.z int 1 run scoreboard players get @s ms.bonfire_z

# Teleport into the correct dimension at the stored coordinates
execute if score @s ms.bonfire_dim matches 0 in minecraft:overworld run function minesouls:bonfire/teleport_macro with storage minesouls:bonfire tp
execute if score @s ms.bonfire_dim matches 1 in minecraft:the_nether run function minesouls:bonfire/teleport_macro with storage minesouls:bonfire tp
execute if score @s ms.bonfire_dim matches 2 in minecraft:the_end run function minesouls:bonfire/teleport_macro with storage minesouls:bonfire tp
execute if score @s ms.bonfire_dim matches 3 in minesouls:the_abyss run function minesouls:bonfire/teleport_macro with storage minesouls:bonfire tp