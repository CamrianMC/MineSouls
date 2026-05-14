# add_sin – adds 1 sin to the player and revokes the kill_innocents advancement
# so it can fire again the next time the player kills a cat, ocelot.
# Runs as the player who triggered the advancement.

advancement revoke @s only minesouls:sin/kill_innocents
scoreboard players add @s ms.sin 1
