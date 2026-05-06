# Reward function for minesouls:achievement/kissing_the_wall_trigger advancement.
# Runs as the player who just traded with a villager.
# Revokes the trigger so it fires again on the next trade.
# Counts trades via ms.trade_count and grants kissing_the_wall at 15.

# Allow the trigger to fire again on the next trade
advancement revoke @s only minesouls:achievement/kissing_the_wall_trigger

# Skip if the player has already earned the achievement
execute if advancement @s minesouls:achievement/kissing_the_wall run return 0

# Increment trade counter
scoreboard players add @s ms.trade_count 1

# Grant the achievement and give the emerald reward at 15 trades
execute if score @s ms.trade_count matches 15.. run advancement grant @s only minesouls:achievement/kissing_the_wall
execute if score @s ms.trade_count matches 15.. run give @s minecraft:emerald 1
