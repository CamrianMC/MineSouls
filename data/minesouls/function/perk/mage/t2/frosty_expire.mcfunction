# Frosty Expire – Kill the frosty when its 30-second timer runs out.
# Runs as the Mage who owns the frosty.

# Kill the nearest frosty snow golem
execute at @s as @e[type=minecraft:snow_golem,tag=ms_frosty,sort=nearest,limit=1] at @s run function minesouls:perk/mage/t2/frosty_die

# Reset player state
scoreboard players set @s ms.frosty_active 0
