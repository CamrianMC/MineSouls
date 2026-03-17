# Enforce the 1-flask-per-player limit each tick.
# Runs as @s (each player) from tick.mcfunction.
#
# Temporary use of ms.estus_uses: this function stores intermediate values in
# ms.estus_uses, but that is safe because track_uses.mcfunction (called
# immediately after) always begins with an unconditional
# `scoreboard players set @s ms.estus_uses 0`, so it does not rely on
# whatever value this function leaves behind.

# Count how many active Estus Flasks are in the player's inventory
execute store result score @s ms.estus_uses run clear @s minecraft:honey_bottle[minecraft:custom_data~{minesouls:{estus_flask:true}}] 0

# Nothing to do if the player has 0 or 1 flask
execute if score @s ms.estus_uses matches ..1 run return 0

# Player has 2+ flasks: calculate excess = count - 1,
# then clear all excess in a single macro call so convergence is immediate
# regardless of how many extras the player obtained (e.g. via creative mode).
scoreboard players remove @s ms.estus_uses 1
execute store result storage minesouls:estus_flask temp.excess int 1 run scoreboard players get @s ms.estus_uses
function minesouls:estus_flask/clear_excess with storage minesouls:estus_flask temp
