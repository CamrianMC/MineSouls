# Explosive Shot – Ranger Tier 2 Perk 2
# Arrows trigger a small explosion on impact.
# Does not inflict damage to other players or terrain.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t2/explosive_shot

# Visual explosion effect and AoE damage at the hit entity's position (no terrain destruction)
execute at @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] run particle minecraft:explosion ~ ~0.5 ~ 0.5 0.5 0.5 0.1 5
execute at @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1.2
execute at @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] run damage @e[type=!minecraft:player,distance=..3,limit=10] 3 minecraft:explosion by @s
