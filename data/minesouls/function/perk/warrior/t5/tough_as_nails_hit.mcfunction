# Tough as Nails – Damage Cap
# Fired by the entity_hurt_player advancement when the player takes damage.
# Death_protection on the offhand prevents fatal hits from killing the player
# before this function can heal back the excess beyond the 5-HP cap.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/warrior/t5/tough_as_nails

# Compute damage = pre-damage snapshot (tan_prev) − current health
scoreboard players operation @s ms.tan_dmg = @s ms.tan_prev
execute store result score @s ms.tan_prev run data get entity @s Health 1
scoreboard players operation @s ms.tan_dmg -= @s ms.tan_prev

# Restore consumed offhand item before early-return checks
# (death_protection may have consumed the item even when damage ≤ 5)
execute unless items entity @s weapon.offhand * if entity @s[tag=ms_tan_protected] run function minesouls:perk/warrior/t5/tan_restore_item

# Debug output
tellraw @s [{"text":"Damage took: ","color":"green"},{"score":{"name":"@s","objective":"ms.tan_dmg"},"color":"red"}]

# If damage is 5 or less, no cap needed
execute if score @s ms.tan_dmg matches ..5 run return 0

# Damage > 5: heal back the excess beyond the 5-point cap
scoreboard players remove @s ms.tan_dmg 5

# Binary decomposition healing: instant_health + regeneration 

execute if score @s ms.tan_dmg matches 12 run effect give @s minecraft:instant_health 1 1 true
execute if score @s ms.tan_dmg matches 12 run effect give @s minecraft:regeneration 2 4 true
execute if score @s ms.tan_dmg matches 12 run scoreboard players remove @s ms.tan_dmg 12

execute if score @s ms.tan_dmg matches 8.. run effect give @s minecraft:instant_health 1 1 true
execute if score @s ms.tan_dmg matches 8.. run scoreboard players remove @s ms.tan_dmg 8

execute if score @s ms.tan_dmg matches 7 run effect give @s minecraft:regeneration 4 4 true
execute if score @s ms.tan_dmg matches 7 run scoreboard players remove @s ms.tan_dmg 7

execute if score @s ms.tan_dmg matches 6 run effect give @s minecraft:regeneration 4 2 true
execute if score @s ms.tan_dmg matches 6 run scoreboard players remove @s ms.tan_dmg 6

execute if score @s ms.tan_dmg matches 5 run effect give @s minecraft:regeneration 3 3 true
execute if score @s ms.tan_dmg matches 5 run scoreboard players remove @s ms.tan_dmg 5

execute if score @s ms.tan_dmg matches 4 run effect give @s minecraft:instant_health 1 0 true
execute if score @s ms.tan_dmg matches 4 run scoreboard players remove @s ms.tan_dmg 4

execute if score @s ms.tan_dmg matches 3 run effect give @s minecraft:regeneration 2 3 true
execute if score @s ms.tan_dmg matches 3 run scoreboard players remove @s ms.tan_dmg 3

execute if score @s ms.tan_dmg matches 2 run effect give @s minecraft:regeneration 2 2 true
execute if score @s ms.tan_dmg matches 2 run scoreboard players remove @s ms.tan_dmg 2

execute if score @s ms.tan_dmg matches 1 run effect give @s minecraft:regeneration 1 2 true
execute if score @s ms.tan_dmg matches 1 run scoreboard players remove @s ms.tan_dmg 1


