# Survival Instincts – Bonfire distance reveal
# Runs when the player has been crouching and stationary for 5 seconds.
# Uses the player's saved bonfire position to calculate approximate distance.

# If the player has no bonfire, inform them
execute unless score @s ms.has_bonfire matches 1 run tellraw @s [{"text":"You sense no bonfire nearby...","color":"dark_aqua","italic":true}]
execute unless score @s ms.has_bonfire matches 1 run return 0

# Store player position (whole blocks)
execute store result score @s ms.si_px run data get entity @s Pos[0]
execute store result score @s ms.si_py run data get entity @s Pos[1]
execute store result score @s ms.si_pz run data get entity @s Pos[2]

# Calculate Manhattan distance to the player's bonfire: |dx| + |dy| + |dz|
scoreboard players operation @s ms.si_temp = @s ms.bonfire_x
scoreboard players operation @s ms.si_temp -= @s ms.si_px

# Absolute value of dx: if negative, negate it
execute if score @s ms.si_temp matches ..-1 run scoreboard players operation @s ms.si_temp *= #-1 ms.const
scoreboard players operation @s ms.si_dist = @s ms.si_temp

# dy component
scoreboard players operation @s ms.si_temp = @s ms.bonfire_y
scoreboard players operation @s ms.si_temp -= @s ms.si_py
execute if score @s ms.si_temp matches ..-1 run scoreboard players operation @s ms.si_temp *= #-1 ms.const
scoreboard players operation @s ms.si_dist += @s ms.si_temp

# dz component
scoreboard players operation @s ms.si_temp = @s ms.bonfire_z
scoreboard players operation @s ms.si_temp -= @s ms.si_pz
execute if score @s ms.si_temp matches ..-1 run scoreboard players operation @s ms.si_temp *= #-1 ms.const
scoreboard players operation @s ms.si_dist += @s ms.si_temp

# Report approximate distance to the player
tellraw @s [{"text":"You sense your bonfire is approximately ","color":"dark_aqua","italic":true},{"score":{"name":"@s","objective":"ms.si_dist"},"color":"gold","bold":true},{"text":" blocks away.","color":"dark_aqua","italic":true}]
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.8 1.2
