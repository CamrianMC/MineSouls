# Void Salts Effect 7: Summon a charged Creeper 1 block in front
tellraw @s {"text":"Something hisses nearby...","color":"dark_purple","italic":true}
execute at @s anchored eyes run summon minecraft:creeper ^ ^ ^1 {powered:1b}
