# Fireball Hit – Apply fire damage at the fireball impact point.
# Runs as the orphaned marker, at the marker's position (impact point).
# Deals 4 fire damage and ignites the nearest hostile mob within 1.5 blocks.

# Tag the nearest hostile for targeting
tag @e[type=#minesouls:hostile,distance=..1.5,sort=nearest,limit=1] add ms_fb_target

# Deal fire damage (attributed to the nearest Mage with Fireball perk for kill credit)
damage @e[tag=ms_fb_target] 4 minecraft:on_fire by @a[scores={ms.class=4,ms.t2_perk=1},sort=nearest,limit=1]

# Set target on fire for 3 seconds (60 ticks)
data modify entity @e[tag=ms_fb_target,limit=1] Fire set value 60

# Cleanup target tag
tag @e[tag=ms_fb_target] remove ms_fb_target

# Impact effects
particle minecraft:flame ~ ~ ~ 0.3 0.3 0.3 0.05 15
particle minecraft:lava ~ ~ ~ 0.2 0.2 0.2 0 5
playsound minecraft:item.firecharge.use player @a[distance=..16] ~ ~ ~ 1 1
