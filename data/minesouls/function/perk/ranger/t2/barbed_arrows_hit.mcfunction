# Barbed Arrows – Ranger Tier 2 Perk 1
# Projectile hits inflict bleed, dealing 1 damage per second for 5 seconds.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t2/barbed_arrows

# Verify a hostile target was hit within projectile range
execute unless entity @e[type=#minesouls:hostile,distance=..64,limit=1,nbt={HurtTime:10s}] run return 0

# Tag the target, apply bleed, and set/refresh timer (100 ticks = 5 seconds)
tag @e[type=#minesouls:hostile,distance=..64,sort=nearest,limit=1,nbt={HurtTime:10s}] add ms_barb_target
execute as @e[tag=ms_barb_target,limit=1] run tag @s add ms_bleeding
execute as @e[tag=ms_barb_target,limit=1] run scoreboard players set @s ms.bleed_timer 100
execute as @e[tag=ms_barb_target,limit=1] run scoreboard players set @s ms.bleed_tick 0
tag @e[tag=ms_barb_target] remove ms_barb_target

# Visual and audio feedback
playsound minecraft:entity.arrow.hit player @s ~ ~ ~ 1 0.8
particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.5 0.3 0.1 8
