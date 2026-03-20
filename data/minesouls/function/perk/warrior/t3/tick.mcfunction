# Warrior Tier 3 perk tick – runs once per tick for every Warrior with a T3 perk.
# Routes to the appropriate perk logic based on ms.t3_perk value.

# Perk 1: Thunder Clap – landing from >=2 block fall damages and knocks back nearby enemies
execute if score @s ms.t3_perk matches 1 run function minesouls:perk/warrior/t3/thunder_clap

# Perk 2: Concussion – decrement cooldown timer each tick
execute if score @s ms.t3_perk matches 2 if score @s ms.concussion_cd matches 1.. run scoreboard players remove @s ms.concussion_cd 1

# Perk 3: Parry – shield block timing window
execute if score @s ms.t3_perk matches 3 run function minesouls:perk/warrior/t3/parry
