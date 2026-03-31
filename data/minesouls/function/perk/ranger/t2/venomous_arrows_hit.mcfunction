# Venomous Arrows – Ranger Tier 2 Perk 3
# Arrows inflict Slowness I for 5 seconds on the target.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t2/venomous_arrows

# Apply Slowness I (5 seconds) to the nearest recently-hurt entity
# HurtTime:10s indicates the entity was just damaged this tick
effect give @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] minecraft:slowness 5 0

# Feedback
playsound minecraft:entity.arrow.hit player @s ~ ~ ~ 1 1.5
