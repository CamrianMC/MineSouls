# Overworld
execute if score @s ms.bonfire_dim matches 0 in minecraft:overworld positioned
    scoreboard @s ms.bonfire_x
    scoreboard @s ms.bonfire_y
    scoreboard @s ms.bonfire_z
run tp @s ~ ~ ~

# Nether
execute if score @s ms.bonfire_dim matches 1 in minecraft:the_nether positioned
    scoreboard @s ms.bonfire_x
    scoreboard @s ms.bonfire_y
    scoreboard @s ms.bonfire_z
run tp @s ~ ~ ~

# End
execute if score @s ms.bonfire_dim matches 2 in minecraft:the_end positioned
    scoreboard @s ms.bonfire_x
    scoreboard @s ms.bonfire_y
    scoreboard @s ms.bonfire_z
run tp @s ~ ~ ~