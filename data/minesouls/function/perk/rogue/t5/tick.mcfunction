# Rogue Tier 5 perk tick – runs once per tick for every Rogue with a T5 perk.
# Routes to the appropriate perk logic based on ms.t5_perk value.

# Perk 1: Cheat Death – fatal damage leaves player at 1 HP (2 min cooldown)
execute if score @s ms.t5_perk matches 1 run function minesouls:perk/rogue/t5/cheat_death

# Perk 2: Shinobi – negates fall damage
execute if score @s ms.t5_perk matches 2 run function minesouls:perk/rogue/t5/shinobi

# Perk 3: Into Thin Air – invisible while crouching, attacks disable for 10s
execute if score @s ms.t5_perk matches 3 run function minesouls:perk/rogue/t5/into_thin_air
