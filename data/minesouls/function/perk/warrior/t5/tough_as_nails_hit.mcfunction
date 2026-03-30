# Tough as Nails – Damage Cap
# Fired by the entity_hurt_player advancement when the player takes damage.
# Damage has already been applied by this point, so we can read the real
# post-damage health and restore the excess if it exceeded the 5-HP cap.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/warrior/t5/tough_as_nails

# Compute damage = pre-damage snapshot (tan_prev) − current health
scoreboard players operation @s ms.tan_dmg = @s ms.tan_prev
execute store result score @s ms.tan_prev run data get entity @s Health 1
scoreboard players operation @s ms.tan_dmg -= @s ms.tan_prev

# If damage is 5 or less, no cap needed — tan_prev already holds current health
tellraw @s [{"text":"Damage took: ","color":"green"},{"score":{"name":"@s","objective":"ms.tan_dmg"},"color":"red"}]
execute if score @s ms.tan_dmg matches ..5 run return 0

data modify storage minesouls:offhand_backup Item set from entity @s Inventory[{Slot:-106b}]
item replace entity @s weapon.offhand with minecraft:cobblestone[minecraft:death_protection={}]

# Damage > 5: restore the excess beyond the 5-point cap
# new_health = current_health + (damage − 5)
scoreboard players remove @s ms.tan_dmg 5
##scoreboard players operation @s ms.tan_prev += @s ms.tan_dmg
##execute if score @s ms.tan_prev matches ..0 run scoreboard players set @s ms.tan_prev 1

# Write the capped health back to the entity
attribute @s minecraft:max_health base set 10
effect give @p minecraft:regeneration 10 255 true
attribute @s minecraft:max_health base set 20