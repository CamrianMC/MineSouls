# Parry – Successful parry effect
# Stuns the nearest hostile mob within 4 blocks for 5 seconds (100 ticks).

# Only trigger if there is a hostile mob in melee range (filters out ranged attacks)
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Stun the nearest hostile mob
tag @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1] add ms_parry_target
execute as @e[tag=ms_parry_target,limit=1] run data merge entity @s {NoAI:1b}
execute as @e[tag=ms_parry_target,limit=1] run scoreboard players set @s ms.stun_timer 100
execute as @e[tag=ms_parry_target,limit=1] run tag @s add ms_stunned
tag @e[tag=ms_parry_target] remove ms_parry_target

# Reset parry timer to prevent repeated triggers in the same window
scoreboard players set @s ms.parry_timer 0

# Visual and audio feedback
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 2 0.7
particle minecraft:crit ~ ~1 ~ 0.5 0.5 0.5 0.1 20
