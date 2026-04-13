# Rogue Tier 1 perk tick – runs once per tick for every Rogue with a T1 perk.
# Routes to the appropriate perk logic based on ms.t1_perk value.

# Perk 1: Light Feet – speed boost while sneaking
execute if score @s ms.t1_perk matches 1 run function minesouls:perk/rogue/t1/light_feet

# Perk 2: Barrel Roll – teleport forward on landing while crouched
execute if score @s ms.t1_perk matches 2 run function minesouls:perk/rogue/t1/barrel_roll

# Perk 3: Pickpocket – permanent Luck I
execute if score @s ms.t1_perk matches 3 run function minesouls:perk/rogue/t1/pickpocket
