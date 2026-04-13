# Focused – Ranger Tier 1 Perk 1 (Hit Handler)
# Called when a Ranger with Perk 1 hits an entity with a projectile.
# Applies 20% bonus damage (~2 for a fully charged bow) if focused.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t1/focused

# Only apply bonus if currently focused
execute unless entity @s[tag=ms_focused] run return 0

# Apply 2 bonus damage to the nearest recently-hurt entity
damage @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] 2 minecraft:generic by @s

# Remove focused state and reset timer
tag @s remove ms_focused
scoreboard players set @s ms.focus_timer 0

# Feedback
playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1.5
particle minecraft:enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0.3 15
