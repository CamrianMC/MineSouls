# Void Salts Effect 4: Give 30 xp levels
tellraw @s {"text":"Knowledge floods your mind!","color":"dark_purple","italic":true}
xp add @s 30 levels
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
