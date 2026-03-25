# Cheat Death – Immediate Fatal Damage Prevention
# Fires instantly when the player takes damage (via entity_hurt_player advancement).
# If the hit would be fatal and the cooldown is inactive, sets health to 1 HP.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/rogue/t5/cheat_death

# If not fatal, just exit
execute if score @s ms.health matches 1.. run return 0

# If on cooldown, do nothing (player dies normally)
execute if score @s ms.cd_cd matches 1.. run return 0

# Set health to 1 HP (prevents death)
execute store result entity @s Health float 1 run scoreboard players get #1 ms.const

# Start 2-minute cooldown (2400 ticks)
scoreboard players set @s ms.cd_cd 2400

# Feedback
tellraw @s [{"text":"Cheat Death","color":"dark_green","bold":true},{"text":" activated! 2 minute cooldown started.","color":"gray"}]
