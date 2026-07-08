# Void Salts Effect 8: Monster noises and creeper hisses over 30 seconds
# Sets a timer (600 ticks) that plays spooky sounds at intervals
tellraw @s {"text":"You hear something in the dark...","color":"dark_purple","italic":true}
scoreboard players set @s ms.void_salts_noise 600
