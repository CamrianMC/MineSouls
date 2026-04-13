# Leeching Strike – Rogue Tier 2 Perk 1
# Restores 1 HP on successful melee attack.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/rogue/t2/leeching_strike

# Restore 1 HP: read current health (10x scale), add 1 HP, cap at 20 HP, set back
effect give @s minecraft:regeneration 1 2 true