# Warrior Tier 4 perk tick – runs once per tick for every Warrior with a T4 perk.
# Routes to the appropriate perk logic based on ms.t4_perk value.

# Perk 1: Adrenaline Rush – boosts speed, haste, and melee damage by 40% when <= 50% HP
execute if score @s ms.t4_perk matches 1 run function minesouls:perk/warrior/t4/adrenaline_rush

# Perk 2: Barbaric Training – +20% melee damage when off hand is empty
execute if score @s ms.t4_perk matches 2 run function minesouls:perk/warrior/t4/barbaric_training

# Perk 3: Calloused Veteran – +4 armor rating at all times
execute if score @s ms.t4_perk matches 3 run function minesouls:perk/warrior/t4/calloused_veteran
