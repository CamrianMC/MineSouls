# Thunder Clap – Landing effect
# Damages and knocks back all hostile mobs within 5 blocks of the player.

# Deal 6 damage (3 hearts) to all nearby hostile mobs with knockback from the player
damage @e[type=#minesouls:hostile,distance=..5] 6 minecraft:mob_attack by @s

# Visual and audio feedback
playsound minecraft:entity.lightning_bolt.thunder player @a[distance=..32] ~ ~ ~ 1 1
particle minecraft:explosion ~ ~ ~ 3 0.5 3 0.1 20
