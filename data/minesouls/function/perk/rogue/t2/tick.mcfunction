# Rogue Tier 2 perk tick – runs once per tick for every Rogue with a T2 perk.
# Routes to the appropriate perk logic based on ms.t2_perk value.

# Perk 2: Dodge – crouch invulnerability window
execute if score @s ms.t2_perk matches 2 run function minesouls:perk/rogue/t2/dodge

# Perk 3: Serious Parkour – speed and jump boost on high landing
execute if score @s ms.t2_perk matches 3 run function minesouls:perk/rogue/t2/serious_parkour
