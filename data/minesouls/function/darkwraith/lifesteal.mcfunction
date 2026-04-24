# Darkwraith – Life-steal heal.
# Runs as the Darkwraith (@s) that detected a hurt player nearby.
# Heals 2 HP (1 heart) by directly raising Health via NBT,
# which the game engine will automatically cap at MaxHealth.

scoreboard players set #dw_heal ms.dw_temp 0
execute store result score #dw_heal ms.dw_temp run data get entity @s Health
scoreboard players add #dw_heal ms.dw_temp 2
execute store result entity @s Health float 1 run scoreboard players get #dw_heal ms.dw_temp
