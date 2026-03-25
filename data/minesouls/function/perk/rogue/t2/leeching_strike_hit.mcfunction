# Leeching Strike – Rogue Tier 2 Perk 1
# Restores 1 HP on successful melee attack.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/rogue/t2/leeching_strike

# Restore 1 HP: read current health (10x scale), add 1 HP, cap at 20 HP, set back
execute store result score @s ms.ls_temp run data get entity @s Health 10
scoreboard players add @s ms.ls_temp 10
execute if score @s ms.ls_temp matches 201.. run scoreboard players set @s ms.ls_temp 200
execute store result entity @s Health float 0.1 run scoreboard players get @s ms.ls_temp
