# This function runs every tick (20 times per second)
# Add your repeating commands here

# Estus Flask: enforce 1-flask limit (remove extras from players who obtained
# a second flask via creative mode or other means)
execute as @a run function minesouls:estus_flask/check_limit

# Estus Flask: keep each player's use-count scoreboard in sync with the item
# they are holding so the count is available inside the on_use reward function
# (which fires after the item is already consumed).
execute as @a run function minesouls:estus_flask/track_uses

# Bonfire rest: decrement the per-player cooldown each tick until it reaches 0
execute as @a[scores={ms.bonfire_rest=1..}] run scoreboard players remove @s ms.bonfire_rest 1

# Bonfire respawn: teleport each player to their bonfire after they die and respawn
execute as @a run function minesouls:bonfire/on_respawn
