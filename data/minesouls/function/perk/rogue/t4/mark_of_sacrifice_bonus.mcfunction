# Mark of Sacrifice bonus – triggered when any player hits a marked entity.
# Applies +2 bonus damage to the target.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/rogue/t4/mark_of_sacrifice_bonus

# Apply 2 bonus damage to the nearest marked entity that was just hit
damage @e[tag=ms_mark_sacrifice,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] 2 minecraft:generic by @s

# Visual and audio feedback
playsound minecraft:entity.player.attack.crit player @s ~ ~ ~ 0.5 1.2
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.5 0.3 0.05 5
