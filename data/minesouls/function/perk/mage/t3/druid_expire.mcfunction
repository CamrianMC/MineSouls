# Druid Expire – Kill the druid wolves when their 30-second timer runs out.
# Runs as the Mage who owns the wolves.

# Kill all druid wolves
execute as @e[type=minecraft:wolf,tag=ms_druid_wolf] at @s run function minesouls:perk/mage/t3/druid_die

# Reset player state
scoreboard players set @s ms.druid_active 0
