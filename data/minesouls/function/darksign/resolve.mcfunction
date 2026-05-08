# Darksign resolve: fires when the 4-second countdown expires.
# Determines whether to teleport the player to their bonfire (1 right-click)
# or to worldspawn (2+ right-clicks), then resets the Darksign state.
#
# For 3+ right-clicks, the bonfire coordinates are intentionally overwritten
# with the worldspawn coordinates (per spec). This resets the player's bonfire
# to worldspawn; they must rest at a bonfire again to set a new location.

effect clear @s minecraft:nausea

# For 3+ right-clicks: overwrite the bonfire coordinates with the stored
# worldspawn coordinates so teleport_home sends the player to worldspawn.
execute if score @s ms.darksign_clicks matches 2.. run scoreboard players operation @s ms.bonfire_x = @s ms.spawn_x
execute if score @s ms.darksign_clicks matches 2.. run scoreboard players operation @s ms.bonfire_y = @s ms.spawn_y
execute if score @s ms.darksign_clicks matches 2.. run scoreboard players operation @s ms.bonfire_z = @s ms.spawn_z
execute if score @s ms.darksign_clicks matches 2.. run scoreboard players set @s ms.bonfire_dim 0

# Play travel sound again at the moment of teleportation (after the countdown and nausea end)
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1 1

# Teleport the player (to their bonfire, or to worldspawn if coords were overwritten)
function minesouls:bonfire/teleport_home

# Reset Darksign state so the next activation starts fresh
scoreboard players set @s ms.darksign_clicks 0

# Grant "Ass-Clenching Escape" if the player started the Darksign with less than 5 HP
execute if score @s ms.darksign_low_hp matches 1 run advancement grant @s only minesouls:achievement/ass_clenching_escape
scoreboard players set @s ms.darksign_low_hp 0
