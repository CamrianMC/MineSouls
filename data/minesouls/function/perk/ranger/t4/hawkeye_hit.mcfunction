# Hawkeye – Ranger Tier 4 Perk 2
# Receive 1 arrow on successful ranged attack.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t4/hawkeye

# Give the player 1 arrow
give @s minecraft:arrow 1

# Feedback
playsound minecraft:entity.item.pickup player @s ~ ~ ~ 0.5 1.5
