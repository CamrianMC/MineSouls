# Ranger Tier 5 perk tick – runs once per tick for every Ranger with a T5 perk.
# Routes to the appropriate perk logic based on ms.t5_perk value.

# Perk 1: Sniper Elite – fired arrows are hitscan (no tick needed, global only)

# Perk 2: Doom – crossbows charge instantly (per-player enchantment)
execute if score @s ms.t5_perk matches 2 run function minesouls:perk/ranger/t5/doom

# Perk 3: Beast Mastery – wolf companion with Strength II + heal on wolf damage
execute if score @s ms.t5_perk matches 3 run function minesouls:perk/ranger/t5/beast_mastery
