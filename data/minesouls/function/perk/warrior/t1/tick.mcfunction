# Warrior Tier 1 perk tick – runs once per tick for every Warrior with a T1 perk.
# Routes to the appropriate perk logic based on ms.t1_perk value.

# Perk 1: Charge – speed boost while looking at an enemy
execute if score @s ms.t1_perk matches 1 run function minesouls:perk/warrior/t1/charge

# Perk 2: Turtle Shell – damage reduction while blocking with a shield
execute if score @s ms.t1_perk matches 2 run function minesouls:perk/warrior/t1/turtle_shell
