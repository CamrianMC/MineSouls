# Ricochet – fire a deflected arrow toward the nearest hostile mob.
# Runs as and at a grounded arrow tagged ms_rico_arrow.
# Limit: one ricochet per shot (original arrow is untagged after this).

# Check for a hostile mob within 8 blocks; if none, do nothing
execute unless entity @e[type=#minesouls:hostile,distance=..8,limit=1] run return 0

# --- Compute direction from arrow to nearest hostile mob ---
# Summon a helper marker 1 block toward the target (unit direction reference)
execute facing entity @e[type=#minesouls:hostile,distance=..8,sort=nearest,limit=1] feet run summon minecraft:marker ^ ^ ^1 {Tags:["ms_rico_helper"]}

# Store arrow position (scaled x10000 for precision)
execute store result score #rico_ax ms.arrow_temp run data get entity @s Pos[0] 10000
execute store result score #rico_ay ms.arrow_temp run data get entity @s Pos[1] 10000
execute store result score #rico_az ms.arrow_temp run data get entity @s Pos[2] 10000

# Store helper position (1 block in direction of target)
execute store result score #rico_hx ms.arrow_temp run data get entity @e[tag=ms_rico_helper,limit=1] Pos[0] 10000
execute store result score #rico_hy ms.arrow_temp run data get entity @e[tag=ms_rico_helper,limit=1] Pos[1] 10000
execute store result score #rico_hz ms.arrow_temp run data get entity @e[tag=ms_rico_helper,limit=1] Pos[2] 10000

# Direction vector = helper - arrow (unit direction * 10000)
scoreboard players operation #rico_hx ms.arrow_temp -= #rico_ax ms.arrow_temp
scoreboard players operation #rico_hy ms.arrow_temp -= #rico_ay ms.arrow_temp
scoreboard players operation #rico_hz ms.arrow_temp -= #rico_az ms.arrow_temp

# Summon new arrow (no pickup, tagged to prevent re-ricochet)
summon minecraft:arrow ~ ~ ~ {Tags:["ms_rico_new","ms_rico_fired"],pickup:0}

# Set Motion on the new arrow: direction * 0.0002 = ~2.0 blocks/tick speed
execute store result entity @e[tag=ms_rico_new,limit=1] Motion[0] double 0.0002 run scoreboard players get #rico_hx ms.arrow_temp
execute store result entity @e[tag=ms_rico_new,limit=1] Motion[1] double 0.0002 run scoreboard players get #rico_hy ms.arrow_temp
execute store result entity @e[tag=ms_rico_new,limit=1] Motion[2] double 0.0002 run scoreboard players get #rico_hz ms.arrow_temp

# Clean up helper and new-arrow tag
kill @e[tag=ms_rico_helper]
tag @e[tag=ms_rico_new] remove ms_rico_new

# Feedback
playsound minecraft:entity.arrow.shoot player @a[distance=..16] ~ ~ ~ 1 1.5
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.1 10
