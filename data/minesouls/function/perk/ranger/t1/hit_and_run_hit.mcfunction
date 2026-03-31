# Hit and Run – Ranger Tier 1 Perk 2
# Firing an arrow increases movement speed by 20% for 8 seconds.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t1/hit_and_run

# Apply Speed I (20% boost) for 8 seconds
effect give @s minecraft:speed 8 0 true

# Feedback
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.5 2
particle minecraft:happy_villager ~ ~ ~ 0.5 0.5 0.5 0.1 10
