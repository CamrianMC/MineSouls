# Rogue Tier 4 perk tick – runs once per tick for every Rogue with a T4 perk.
# Routes to the appropriate perk logic based on ms.t4_perk value.

# Perk 1: Mark of Sacrifice – critical hits mark target for +2 damage from all sources for 5s
# (handled entirely via advancements; no tick logic needed)

# Perk 2: Backstab – 10x melee damage from behind while crouching
execute if score @s ms.t4_perk matches 2 run function minesouls:perk/rogue/t4/backstab

# Perk 3: Nightfall – night vision and +20% melee damage while in darkness
execute if score @s ms.t4_perk matches 3 run function minesouls:perk/rogue/t4/nightfall
