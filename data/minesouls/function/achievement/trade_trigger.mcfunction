# Allow the trigger to fire again on the next trade
advancement revoke @s only minesouls:achievement/kissing_the_wall_trigger

# Skip if the player has already earned the achievement
execute if entity @s[tag=ms.ach.kissing_the_wall] run return 0

# Increment trade counter
scoreboard players add @s ms.trade_count 1

# Grant the achievement and give the Yamaka reward at 15 trades
execute if score @s ms.trade_count matches 15.. run advancement grant @s only minesouls:achievement/kissing_the_wall
execute if score @s ms.trade_count matches 15.. run tag @s add ms.ach.kissing_the_wall
execute if score @s ms.trade_count matches 15.. run function minesouls:yamaka/give