# Bodyguard Expire – Kill the iron golems when their 30-second timer runs out.
# Runs as the Mage who owns the bodyguards.

# Kill all bodyguard iron golems
execute as @e[type=minecraft:iron_golem,tag=ms_bodyguard] at @s run function minesouls:perk/mage/t4/bodyguard_die

# Reset player state
scoreboard players set @s ms.bodyguard_active 0
