# Impenetrable Wall – Shield Block Counterattack
# Triggered when the player successfully blocks an attack with a shield.
# Damages and knocks back all hostile mobs within 4 blocks (melee range).

# Only trigger if there is a hostile mob in melee range
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Deal 10 damage with knockback from the player to all nearby hostiles
execute as @e[type=#minesouls:hostile,distance=..4] run damage @s 10 minecraft:player_attack by @p
execute as @e[type=#minesouls:hostile,distance=..4] at @s run tp @s ^ ^ ^-3

# Visual and audio feedback
playsound minecraft:item.shield.block master @a[distance=..16] ~ ~ ~ 2 0.5
particle minecraft:crit ~ ~1 ~ 0.5 0.5 0.5 0.1 15
