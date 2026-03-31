# Ranger Tier 4 perk tick – runs once per tick for every Ranger with a T4 perk.
# Routes to the appropriate perk logic based on ms.t4_perk value.

# Perk 1: Survival Instincts – glowing on nearby hostiles while sneaking, bonfire distance after 5s still
execute if score @s ms.t4_perk matches 1 run function minesouls:perk/ranger/t4/survival_instincts

# Perk 2: Hawkeye – (advancement-based, no tick needed)

# Perk 3: Disengage – backwards jump when crouching while falling
execute if score @s ms.t4_perk matches 3 run function minesouls:perk/ranger/t4/disengage
