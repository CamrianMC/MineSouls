# Goyim Expire – Kill the goyim when its 15-second timer runs out.
# Runs as the Mage who owns the goyim.

# Kill the nearest goyim villager
execute at @s as @e[type=minecraft:villager,tag=ms_goyim,sort=nearest,limit=1] at @s run function minesouls:perk/mage/t1/goyim_die

# Reset player state
scoreboard players set @s ms.goyim_active 0
