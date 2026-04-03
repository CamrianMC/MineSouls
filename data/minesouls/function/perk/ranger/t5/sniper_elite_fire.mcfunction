# Sniper Elite – Begin hitscan raycast from the Ranger's eyes.
# Runs as the Ranger, at the Ranger's eye position, with the Ranger's look rotation.

# Initialize step counter
scoreboard players set @s ms.se_steps 0

# Visual: muzzle flash at eyes
particle minecraft:flash ~ ~ ~ 0 0 0 0 1

# Audio: sharp shot sound
playsound minecraft:entity.firework_rocket.blast player @s ~ ~ ~ 1 2

# Begin recursive raycast
execute positioned ^ ^ ^0.5 run function minesouls:perk/ranger/t5/sniper_elite_raycast
