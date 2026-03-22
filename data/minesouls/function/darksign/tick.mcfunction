# Darksign countdown tick.
# Runs once per tick for each player whose ms.darksign_timer is >= 1.

# Decrement the countdown timer by one tick
scoreboard players remove @s ms.darksign_timer 1

# When the timer reaches 0, resolve the teleport destination
execute if score @s ms.darksign_timer matches 0 run function minesouls:darksign/resolve
