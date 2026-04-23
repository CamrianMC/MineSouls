# Sniper Elite – Ricochet handler for hitscan raycast.
# Called when the raycast hits a solid block and the Ranger has T3 Perk 1 (Ricochet).
# Spawns a redirected arrow toward the nearest hostile mob within 8 blocks.

# Check for a hostile mob within 8 blocks; if none, do nothing
execute unless entity @e[type=#minesouls:hostile,distance=..8,limit=1] run return 0

# --- Compute direction from impact to nearest hostile mob ---
# Summon a helper marker 1 block toward the target (unit direction reference)
execute facing entity @e[type=#minesouls:hostile,distance=..8,sort=nearest,limit=1] feet run summon minecraft:marker ^ ^ ^1 {Tags:["ms_se_rico_helper"]}

# Store impact position (scaled x10000 for precision)
summon minecraft:marker ~ ~ ~ {Tags:["ms_se_rico_origin"]}
execute store result score #se_rico_ax ms.arrow_temp run data get entity @e[tag=ms_se_rico_origin,limit=1] Pos[0] 10000
execute store result score #se_rico_ay ms.arrow_temp run data get entity @e[tag=ms_se_rico_origin,limit=1] Pos[1] 10000
execute store result score #se_rico_az ms.arrow_temp run data get entity @e[tag=ms_se_rico_origin,limit=1] Pos[2] 10000

# Store helper position (1 block in direction of target)
execute store result score #se_rico_hx ms.arrow_temp run data get entity @e[tag=ms_se_rico_helper,limit=1] Pos[0] 10000
execute store result score #se_rico_hy ms.arrow_temp run data get entity @e[tag=ms_se_rico_helper,limit=1] Pos[1] 10000
execute store result score #se_rico_hz ms.arrow_temp run data get entity @e[tag=ms_se_rico_helper,limit=1] Pos[2] 10000

# Direction vector = helper - origin (unit direction * 10000)
scoreboard players operation #se_rico_hx ms.arrow_temp -= #se_rico_ax ms.arrow_temp
scoreboard players operation #se_rico_hy ms.arrow_temp -= #se_rico_ay ms.arrow_temp
scoreboard players operation #se_rico_hz ms.arrow_temp -= #se_rico_az ms.arrow_temp

# Summon new arrow (no pickup, tagged to prevent re-ricochet)
summon minecraft:arrow ~ ~ ~ {Tags:["ms_se_rico_new","ms_rico_fired"],pickup:0}

# Set Motion on the new arrow: direction * 0.0002 = ~2.0 blocks/tick speed
execute store result entity @e[tag=ms_se_rico_new,limit=1] Motion[0] double 0.0002 run scoreboard players get #se_rico_hx ms.arrow_temp
execute store result entity @e[tag=ms_se_rico_new,limit=1] Motion[1] double 0.0002 run scoreboard players get #se_rico_hy ms.arrow_temp
execute store result entity @e[tag=ms_se_rico_new,limit=1] Motion[2] double 0.0002 run scoreboard players get #se_rico_hz ms.arrow_temp

# Set Owner so perk advancements trigger correctly on hit
data modify entity @e[tag=ms_se_rico_new,limit=1] Owner set from entity @s UUID

# Copy weapon data for enchantment application on hit
data modify entity @e[tag=ms_se_rico_new,limit=1] weapon set from storage minesouls:se_bow Weapon

# Clean up helpers and temp tags
kill @e[tag=ms_se_rico_helper]
kill @e[tag=ms_se_rico_origin]
tag @e[tag=ms_se_rico_new] remove ms_se_rico_new

# Feedback
playsound minecraft:entity.arrow.shoot player @a[distance=..16] ~ ~ ~ 1 1.5
particle minecraft:crit ~ ~ ~ 0.2 0.2 0.2 0.1 10