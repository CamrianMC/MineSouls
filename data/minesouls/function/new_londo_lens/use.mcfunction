# Called when a player right-clicks the Eye of New Londo.
# Runs as the player, at the player's location.
# TODO: fill in the desired active effect here.

execute as @e[type=marker,tag=ms_manus,distance=..10,limit=1] at @s run function minesouls:manus/init