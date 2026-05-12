# Summon Knight Artorias 10 blocks ahead of the summoner.
# Runs as the player whose ms.arta_summon_timer just reached 0.

# Spawn Artorias at the position 10 blocks in front of the player
# (^ ^ ^10 = local coordinates: 0 left, 0 up, 10 forward)
execute at @s positioned ^ ^ ^10 run function minesouls:artorias/init
