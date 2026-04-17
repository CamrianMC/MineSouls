# Doom – Instant bow fire (triggered by using_item advancement for bows)
# Summons a fully-charged arrow in the look direction, then replaces the bow
# in-hand with an identical copy to cancel the draw animation.
# The arrow's Owner is set so doom_tick detects it and spawns the spray.

# Always revoke so the advancement can re-trigger on the next draw
advancement revoke @s only minesouls:perk/ranger/t5/doom_bow_draw

# Only Ranger (class 3) with Doom perk (t5_perk 2)
execute unless score @s ms.class matches 3 run return 0
execute unless score @s ms.t5_perk matches 2 run return 0

# --- Determine which hand holds the bow ---
execute if items entity @s weapon.mainhand minecraft:bow run tag @s add ms_doom_bow_main
execute unless entity @s[tag=ms_doom_bow_main] if items entity @s weapon.offhand minecraft:bow run tag @s add ms_doom_bow_off
execute unless entity @s[tag=ms_doom_bow_main] unless entity @s[tag=ms_doom_bow_off] run return 0

# --- Save the bow to storage via barrel at y=319 ---
setblock ~ 319 ~ minecraft:barrel
execute if entity @s[tag=ms_doom_bow_main] run item replace block ~ 319 ~ container.0 from entity @s weapon.mainhand
execute if entity @s[tag=ms_doom_bow_off] run item replace block ~ 319 ~ container.0 from entity @s weapon.offhand
data modify storage minesouls:doom_bow Item set from block ~ 319 ~ Items[0]
setblock ~ 319 ~ minecraft:air

# --- Summon a fully-charged arrow using the marker direction trick ---
# Origin marker at eye position
execute anchored eyes run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_bow_origin"]}
execute store result score #dbow_ox ms.arrow_temp run data get entity @e[tag=ms_doom_bow_origin,limit=1] Pos[0] 10000
execute store result score #dbow_oy ms.arrow_temp run data get entity @e[tag=ms_doom_bow_origin,limit=1] Pos[1] 10000
execute store result score #dbow_oz ms.arrow_temp run data get entity @e[tag=ms_doom_bow_origin,limit=1] Pos[2] 10000

# Direction marker 1 block ahead of eyes
execute anchored eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_bow_dir"]}
execute store result score #dbow_dx ms.arrow_temp run data get entity @e[tag=ms_doom_bow_dir,limit=1] Pos[0] 10000
execute store result score #dbow_dy ms.arrow_temp run data get entity @e[tag=ms_doom_bow_dir,limit=1] Pos[1] 10000
execute store result score #dbow_dz ms.arrow_temp run data get entity @e[tag=ms_doom_bow_dir,limit=1] Pos[2] 10000

# Compute direction delta
scoreboard players operation #dbow_dx ms.arrow_temp -= #dbow_ox ms.arrow_temp
scoreboard players operation #dbow_dy ms.arrow_temp -= #dbow_oy ms.arrow_temp
scoreboard players operation #dbow_dz ms.arrow_temp -= #dbow_oz ms.arrow_temp

# Summon arrow at eye position (speed 3.0 = fully-charged bow, no pickup)
execute anchored eyes run summon minecraft:arrow ~ ~ ~ {Tags:["ms_doom_bow_new"],pickup:0}
execute store result entity @e[tag=ms_doom_bow_new,limit=1] Motion[0] double 0.0003 run scoreboard players get #dbow_dx ms.arrow_temp
execute store result entity @e[tag=ms_doom_bow_new,limit=1] Motion[1] double 0.0003 run scoreboard players get #dbow_dy ms.arrow_temp
execute store result entity @e[tag=ms_doom_bow_new,limit=1] Motion[2] double 0.0003 run scoreboard players get #dbow_dz ms.arrow_temp

# Set arrow owner to this player so doom_tick spray detection works via 'on origin'
data modify entity @e[tag=ms_doom_bow_new,limit=1] Owner set from entity @s UUID

# Copy bow item to the arrow's weapon field so enchantments (Power, Flame, Punch) apply on hit
# Strip the container Slot field to produce a clean item stack for the weapon field
data modify storage minesouls:doom_bow Weapon set from storage minesouls:doom_bow Item
data remove storage minesouls:doom_bow Weapon.Slot
data modify entity @e[tag=ms_doom_bow_new,limit=1] weapon set from storage minesouls:doom_bow Weapon

# Cleanup markers and temp tag
kill @e[tag=ms_doom_bow_origin]
kill @e[tag=ms_doom_bow_dir]
tag @e[tag=ms_doom_bow_new] remove ms_doom_bow_new

# --- Restore the bow to cancel the draw ---
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items append from storage minesouls:doom_bow Item
execute if entity @s[tag=ms_doom_bow_main] run item replace entity @s weapon.mainhand from block ~ 319 ~ container.0
execute if entity @s[tag=ms_doom_bow_off] run item replace entity @s weapon.offhand from block ~ 319 ~ container.0
setblock ~ 319 ~ minecraft:air

# Cleanup hand tags
tag @s remove ms_doom_bow_main
tag @s remove ms_doom_bow_off

# --- Feedback ---
playsound minecraft:entity.arrow.shoot player @s ~ ~ ~ 1 1.5
particle minecraft:flame ~ ~1.5 ~ 0.3 0.3 0.3 0.05 5
