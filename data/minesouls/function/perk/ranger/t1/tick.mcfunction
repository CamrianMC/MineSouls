# Ranger Tier 1 perk tick – runs once per tick for every Ranger with a T1 perk.
# Routes to the appropriate perk logic based on ms.t1_perk value.

# Perk 1: Focused – standing still for 3s boosts next shot damage by 20%
execute if score @s ms.t1_perk matches 1 run function minesouls:perk/ranger/t1/focused

# Perk 2: Hit and Run – (advancement-based, no tick needed)

# Perk 3: Eagle's Nest – slow wallclimb, consumes hunger
execute if score @s ms.t1_perk matches 3 run function minesouls:perk/ranger/t1/eagles_nest
