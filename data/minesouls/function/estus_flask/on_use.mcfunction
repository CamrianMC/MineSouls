# Reward function for minesouls:estus_flask/consumed advancement.
# Runs as the player who just consumed an Estus Flask.
#
# Execution order:
#   1. Revoke the advancement so it can fire again on the next use.
#   2. Remove the glass bottle returned by honey_bottle consumption.
#   3. Apply healing only if the flask had remaining uses (score from last tick).
#   4. Decrement the use counter.
#   5. Give back the flask with the updated use count, or the depleted item.

# Allow the advancement to trigger again
advancement revoke @s only minesouls:estus_flask/consumed

# honey_bottle returns a glass bottle on consumption; remove it
clear @s minecraft:glass_bottle 1

# Regeneration IV (amplifier 3) heals 1 HP every 6.25 ticks (50 / 2^3).
# Over 3 seconds (60 ticks) that is ~9-10 HP, approximately half the default
# 20 HP health bar – the closest discrete level to the "half health" goal.
# Only heal if the flask still had uses when it was consumed.
execute if score @s ms.estus_uses matches 1.. run effect give @s minecraft:regeneration 3 3 true

# Decrement uses
scoreboard players remove @s ms.estus_uses 1

# Mirror the new count into command storage so the macro function can read it
execute store result storage minesouls:estus_flask flask_data.uses int 1 run scoreboard players get @s ms.estus_uses

# Give a flask with the updated use count (if uses remain) …
execute if score @s ms.estus_uses matches 1.. run function minesouls:estus_flask/give_macro with storage minesouls:estus_flask flask_data

# … or give the depleted flask when all uses are exhausted
execute if score @s ms.estus_uses matches ..0 run function minesouls:estus_flask/give_depleted
