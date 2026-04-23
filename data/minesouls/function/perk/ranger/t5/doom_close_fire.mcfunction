# Doom – Begin close-range raycast from the Ranger's eyes.
# Runs as the Ranger, at the Ranger's eye position, with the Ranger's look rotation.
# Compensates for MC Java's simultaneous arrow damage immunity at close range.
# If a mob is found within 5 blocks, deals bonus damage for the 4 spray arrows
# that would have hit but dealt no damage.

# Initialize step counter
scoreboard players set @s ms.doom_steps 0

# Begin recursive raycast (5 blocks = 10 steps at 0.5 blocks each)
execute positioned ^ ^ ^0.5 run function minesouls:perk/ranger/t5/doom_close_raycast
