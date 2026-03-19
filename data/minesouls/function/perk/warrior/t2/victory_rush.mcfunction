# Victory Rush – Warrior Tier 2 Perk 1
# Killing a hostile mob with a melee attack restores 4 HP (2 hearts).

# Revoke advancement so it can trigger again on the next kill
advancement revoke @s only minesouls:perk/warrior/t2/victory_rush

# Heal 4 HP (2 hearts)
effect give @s minecraft:instant_health 1 0 true
