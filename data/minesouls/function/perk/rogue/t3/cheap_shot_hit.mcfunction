# Cheap Shot – Rogue Tier 3 Perk 2
# 20% increased bow/crossbow damage while crouched.
# Applies 2 bonus damage (~20% of full-charge bow damage) to the target on projectile hit.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/rogue/t3/cheap_shot

# Apply 2 bonus damage to the nearest recently-hurt entity within projectile range
# HurtTime:10s indicates the entity was just damaged this tick
damage @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] 2 minecraft:generic by @s

# Visual and audio feedback
playsound minecraft:entity.arrow.hit player @s ~ ~ ~ 1 1.5
