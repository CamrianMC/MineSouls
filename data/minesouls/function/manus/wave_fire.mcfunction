# Wave Fire – reset timer, tag a random nearby player, then delegate to wave_fire_aimed.
# Runs as Manus at Manus.

# Reset the wave cooldown
scoreboard players set @s ms.manus_wave_timer 60

# Tag one random player within 50 blocks as the wave target
tag @a[distance=..50,sort=random,limit=1] add ms_manus_wave_target

# Aim at the tagged player and fire
execute facing entity @a[tag=ms_manus_wave_target,limit=1] eyes run function minesouls:manus/wave_fire_aimed

# Remove the temporary target tag
tag @a[tag=ms_manus_wave_target] remove ms_manus_wave_target
