# Tough as Nails – Immediate Damage Cap
# Fires instantly when the player takes damage (via entity_hurt_player advancement).
# If damage exceeds 5 HP, sets health directly to (prev - 5) to cap the hit.
# Runs during damage processing, before the death check – prevents fatal one-shots.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/warrior/t5/tough_as_nails

# Calculate damage taken: damage = prev - current
scoreboard players operation @s ms.tan_dmg = @s ms.tan_prev
scoreboard players operation @s ms.tan_dmg -= @s ms.health

# If damage is 5 or less, just update prev and exit
execute if score @s ms.tan_dmg matches ..5 run scoreboard players operation @s ms.tan_prev = @s ms.health
execute if score @s ms.tan_dmg matches ..5 run return 0

# Excess damage: set health to (prev - 5), clamped to at least 1 HP
scoreboard players remove @s ms.tan_prev 5
execute if score @s ms.tan_prev matches ..0 run scoreboard players set @s ms.tan_prev 1

# Set health directly (scale 1 maps scoreboard int 1:1 to Health float, e.g. 15 → 15.0 HP)
execute store result entity @s Health float 1 run scoreboard players get @s ms.tan_prev
