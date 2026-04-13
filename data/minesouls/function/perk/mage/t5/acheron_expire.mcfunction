# Acheron Expire – Kill the wither when its 20-second timer runs out.
# Runs as the Mage who owns the wither.

# Kill all acheron withers
execute as @e[type=minecraft:wither,tag=ms_acheron] at @s run function minesouls:perk/mage/t5/acheron_die

# Reset player state
scoreboard players set @s ms.acheron_active 0
