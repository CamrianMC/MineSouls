# Warrior Tier 2 perk tick – runs once per tick for every Warrior with a T2 perk.
# Routes to the appropriate perk logic based on ms.t2_perk value.

# Perk 2: Second Wind – slowly restore health while below 50% HP
execute if score @s ms.t2_perk matches 2 run function minesouls:perk/warrior/t2/second_wind

# Perk 3: Aura Farming – ranged/AoE damage reduction
execute if score @s ms.t2_perk matches 3 run function minesouls:perk/warrior/t2/aura_farming
