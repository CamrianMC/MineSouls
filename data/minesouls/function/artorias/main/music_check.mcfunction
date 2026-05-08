# Knight Artorias – Per-player music / atmosphere check
# Runs as each player every tick from tick.mcfunction.
# Plays an ambient horror sound periodically while the boss is alive nearby.

# Decrement timer
execute if entity @e[type=vindicator,tag=ms_artorias,distance=..50] if score @s ms.arta_music_timer matches 1.. run scoreboard players remove @s ms.arta_music_timer 1

# Reset timer when not near the boss
execute unless entity @e[type=vindicator,tag=ms_artorias,distance=..50] run scoreboard players set @s ms.arta_music_timer 0

# Play ambient sound once the timer expires (only if near boss)
execute if entity @e[type=vindicator,tag=ms_artorias,distance=..50] if score @s ms.arta_music_timer matches ..0 run playsound minecraft:ambient.basalt_deltas.mood ambient @s ~ ~ ~ 0.6 0.7
execute if entity @e[type=vindicator,tag=ms_artorias,distance=..50] if score @s ms.arta_music_timer matches ..0 run scoreboard players set @s ms.arta_music_timer 220
