# Survival Instincts – Bonfire distance reveal
# Runs when the player has been crouching and stationary for 5 seconds.
# Locates the nearest bonfire structure and reports approximate distance.

# Reset distances
scoreboard players set @s ms.si_dist 0
scoreboard players set @s ms.si_temp 0

# --- Overworld: check both surface and underground bonfires, pick closer ---
execute if predicate minesouls:in_overworld store result score @s ms.si_dist run locate structure minesouls:bonfire
execute if predicate minesouls:in_overworld store result score @s ms.si_temp run locate structure minesouls:bonfire_underground
# If surface wasn't found, use underground
execute if predicate minesouls:in_overworld if score @s ms.si_dist matches 0 run scoreboard players operation @s ms.si_dist = @s ms.si_temp
# If both found, use the closer one
execute if predicate minesouls:in_overworld unless score @s ms.si_temp matches 0 if score @s ms.si_temp < @s ms.si_dist run scoreboard players operation @s ms.si_dist = @s ms.si_temp

# --- Nether: locate nether bonfires ---
execute if predicate minesouls:in_nether store result score @s ms.si_dist run locate structure minesouls:bonfire_nether

# --- End: locate surface bonfires ---
execute if predicate minesouls:in_end store result score @s ms.si_dist run locate structure minesouls:bonfire

# If no bonfire was found (distance is 0)
execute if score @s ms.si_dist matches 0 run tellraw @s [{"text":"You sense no bonfire nearby...","color":"dark_aqua","italic":true}]
execute if score @s ms.si_dist matches 0 run return 0

# Report approximate distance to the player
tellraw @s [{"text":"You sense a bonfire is approximately ","color":"dark_aqua","italic":true},{"score":{"name":"@s","objective":"ms.si_dist"},"color":"gold","bold":true},{"text":" blocks away.","color":"dark_aqua","italic":true}]
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.8 1.2
