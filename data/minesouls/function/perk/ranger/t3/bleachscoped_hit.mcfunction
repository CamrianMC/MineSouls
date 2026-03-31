# Bleachscoped – Ranger Tier 3 Perk 3
# 1.5x headshot damage: if the arrow strikes at the top portion of the mob's
# model, apply bonus damage equal to 50% of a standard arrow hit (~3 damage).
# Head zone = entity feet Y + 1.5 blocks and above (covers most humanoid mob heads).

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t3/bleachscoped

# Tag the hit entity
tag @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] add ms_hs_target

# Bail out if no target found
execute unless entity @e[tag=ms_hs_target,limit=1] run return 0

# Tag the nearest arrow to the hit entity (within 3 blocks – should be the impacting arrow)
execute at @e[tag=ms_hs_target,limit=1] run tag @e[type=#minesouls:arrow,distance=..3,sort=nearest,limit=1] add ms_hs_arrow

# If no arrow found nearby, skip headshot check (arrow may have been absorbed)
execute unless entity @e[tag=ms_hs_arrow,limit=1] run tag @e[tag=ms_hs_target] remove ms_hs_target
execute unless entity @e[tag=ms_hs_arrow,limit=1] run return 0

# Get arrow Y position (scaled x100)
execute store result score #hs_ay ms.arrow_temp run data get entity @e[tag=ms_hs_arrow,limit=1] Pos[1] 100

# Get entity feet Y position (scaled x100)
execute store result score #hs_ey ms.arrow_temp run data get entity @e[tag=ms_hs_target,limit=1] Pos[1] 100

# Head zone threshold: entity feet Y + 1.5 blocks (150 at scale 100)
scoreboard players add #hs_ey ms.arrow_temp 150

# If arrow Y >= head zone threshold → headshot! Apply 50% bonus damage (~3)
execute if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run damage @e[tag=ms_hs_target,limit=1] 3 minecraft:arrow by @s
execute if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 2
execute if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp at @e[tag=ms_hs_target,limit=1] run particle minecraft:crit ~ ~2 ~ 0.3 0.3 0.3 0.2 15
execute if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run tellraw @s {"text":"☠ Headshot!","color":"red","bold":true}

# Clean up tags
tag @e[tag=ms_hs_arrow] remove ms_hs_arrow
tag @e[tag=ms_hs_target] remove ms_hs_target
