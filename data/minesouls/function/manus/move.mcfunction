# Manus Movement – teleports Manus to 5 blocks in front of a random nearby player,
# facing the player.  Simulates aggressive pursuit without relying on Warden aggro AI.
# Runs as Manus at Manus.

# Reset the move timer (100 ticks = 5 seconds)
scoreboard players set @s ms.manus_move_timer 100

# Pick a random nearby player as the move target
tag @a[distance=..80,sort=random,limit=1] add ms_manus_move_target

# Departure soul-flame burst at current location before the jump
particle minecraft:soul_fire_flame ~ ~1 ~ 1.0 1.5 1.0 0.05 20 normal

# Teleport Manus to 5 blocks in front of the chosen player, facing the player's eyes.
# execute as <player> at @s – sets context position/rotation to the player.
# positioned ^ ^ ^5  – shifts 5 blocks forward along the player's facing direction.
# The teleport target ~ ~ ~ is therefore the spot 5 blocks ahead of the player.
execute as @a[tag=ms_manus_move_target,limit=1] at @s positioned ~ ~ ~5 run teleport @e[tag=ms_manus,limit=1] ~ ~ ~ facing entity @a[tag=ms_manus_move_target,limit=1] eyes

# Arrival effects at the new location
execute at @e[tag=ms_manus,limit=1] run particle minecraft:soul_fire_flame ~ ~1 ~ 1.0 1.5 1.0 0.05 30 normal
execute at @e[tag=ms_manus,limit=1] run playsound minecraft:entity.enderman.teleport hostile @a[distance=..80] ~ ~ ~ 1 0.5

# Remove the temporary move target tag
tag @a[tag=ms_manus_move_target] remove ms_manus_move_target

# Summon a descending dark energy ball at a random spot within 5 blocks (ground shockwave attack)
# Uses execute at @e[tag=ms_manus,limit=1] to spawn relative to Manus' new position after teleport
execute at @e[tag=ms_manus,limit=1] run function minesouls:manus/dark_ball_fire
