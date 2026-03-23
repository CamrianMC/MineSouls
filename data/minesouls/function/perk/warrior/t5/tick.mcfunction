# Warrior Tier 5 perk tick – runs once per tick for every Warrior with a T5 perk.
# Routes to the appropriate perk logic based on ms.t5_perk value.

# Perk 1: Avernus – fire immunity and regeneration while on fire
execute if score @s ms.t5_perk matches 1 run function minesouls:perk/warrior/t5/avernus

# Perk 2: Tough as Nails – cap incoming damage at 5 per hit
execute if score @s ms.t5_perk matches 2 run function minesouls:perk/warrior/t5/tough_as_nails

# Perk 3: Impenetrable Wall – infinite shield durability, shield blocks counterattack
execute if score @s ms.t5_perk matches 3 run function minesouls:perk/warrior/t5/impenetrable_wall
