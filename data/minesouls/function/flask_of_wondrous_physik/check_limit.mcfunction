# Enforce the 1-flask-per-player limit each tick.
# Runs as @s (each player) from tick.mcfunction.

# Count physik flasks in the player's inventory (0 = dry run, no items removed)
execute store result score @s ms.physik_count run clear @s minecraft:potion[minecraft:custom_data~{minesouls:{physik_flask:true}}] 0

# Nothing to do if the player has 0 or 1 flask
execute if score @s ms.physik_count matches ..1 run return 0

# Player has 2+ flasks: calculate excess = count - 1,
# then clear all extras at once via macro so convergence is immediate
scoreboard players remove @s ms.physik_count 1
execute store result storage minesouls:physik_flask temp.excess int 1 run scoreboard players get @s ms.physik_count
function minesouls:flask_of_wondrous_physik/clear_excess with storage minesouls:physik_flask temp
