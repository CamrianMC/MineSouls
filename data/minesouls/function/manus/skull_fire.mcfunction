# Skull Fire – reset timer, tag a random nearby player, then delegate to skull_fire_aimed.
# Runs as Manus at Manus.

# Reset the skull cooldown
scoreboard players set @s ms.manus_skull_timer 10

# Tag one random player within 50 blocks as the skull target
tag @a[distance=..50,sort=random,limit=1] add ms_manus_target

# Aim at the tagged player and fire (execute facing entity gives us the correct rotation)
execute facing entity @a[tag=ms_manus_target,limit=1] eyes run function minesouls:manus/skull_fire_aimed

# Remove the temporary target tag
tag @a[tag=ms_manus_target] remove ms_manus_target
