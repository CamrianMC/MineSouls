# Doom – Spawn a spray of 4 extra arrows from the Ranger's eyes.
# Runs as the Ranger, at the Ranger's position.
# Uses the marker direction trick to compute motion for each spread arrow.
# Each spray arrow gets Owner (for perk advancement triggers) and weapon
# (for enchantment application on hit) copied from the main doom arrow.

# --- Store eye position via origin marker ---
execute anchored eyes positioned ^ ^ ^ run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_origin"]}
execute store result score #doom_ox ms.arrow_temp run data get entity @e[tag=ms_doom_origin,limit=1] Pos[0] 10000
execute store result score #doom_oy ms.arrow_temp run data get entity @e[tag=ms_doom_origin,limit=1] Pos[1] 10000
execute store result score #doom_oz ms.arrow_temp run data get entity @e[tag=ms_doom_origin,limit=1] Pos[2] 10000

# --- Spray Arrow 1: left 10°, up 3° ---
execute anchored eyes rotated ~-10 ~-3 positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_h"]}
execute store result score #doom_dx ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[0] 10000
execute store result score #doom_dy ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[1] 10000
execute store result score #doom_dz ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[2] 10000
scoreboard players operation #doom_dx ms.arrow_temp -= #doom_ox ms.arrow_temp
scoreboard players operation #doom_dy ms.arrow_temp -= #doom_oy ms.arrow_temp
scoreboard players operation #doom_dz ms.arrow_temp -= #doom_oz ms.arrow_temp
execute anchored eyes positioned ^ ^ ^ run summon minecraft:arrow ~ ~ ~ {Tags:["ms_doom_n","ms_doom_spray"],pickup:0}
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[0] double 0.0002 run scoreboard players get #doom_dx ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[1] double 0.0002 run scoreboard players get #doom_dy ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[2] double 0.0002 run scoreboard players get #doom_dz ms.arrow_temp
data modify entity @e[tag=ms_doom_n,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=ms_doom_n,limit=1] weapon set from storage minesouls:doom_bow Weapon
kill @e[tag=ms_doom_h]
tag @e[tag=ms_doom_n] remove ms_doom_n

# --- Spray Arrow 2: right 10°, up 3° ---
execute anchored eyes rotated ~10 ~-3 positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_h"]}
execute store result score #doom_dx ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[0] 10000
execute store result score #doom_dy ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[1] 10000
execute store result score #doom_dz ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[2] 10000
scoreboard players operation #doom_dx ms.arrow_temp -= #doom_ox ms.arrow_temp
scoreboard players operation #doom_dy ms.arrow_temp -= #doom_oy ms.arrow_temp
scoreboard players operation #doom_dz ms.arrow_temp -= #doom_oz ms.arrow_temp
execute anchored eyes positioned ^ ^ ^ run summon minecraft:arrow ~ ~ ~ {Tags:["ms_doom_n","ms_doom_spray"],pickup:0}
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[0] double 0.0002 run scoreboard players get #doom_dx ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[1] double 0.0002 run scoreboard players get #doom_dy ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[2] double 0.0002 run scoreboard players get #doom_dz ms.arrow_temp
data modify entity @e[tag=ms_doom_n,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=ms_doom_n,limit=1] weapon set from storage minesouls:doom_bow Weapon
kill @e[tag=ms_doom_h]
tag @e[tag=ms_doom_n] remove ms_doom_n

# --- Spray Arrow 3: left 5°, down 8° ---
execute anchored eyes rotated ~-5 ~8 positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_h"]}
execute store result score #doom_dx ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[0] 10000
execute store result score #doom_dy ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[1] 10000
execute store result score #doom_dz ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[2] 10000
scoreboard players operation #doom_dx ms.arrow_temp -= #doom_ox ms.arrow_temp
scoreboard players operation #doom_dy ms.arrow_temp -= #doom_oy ms.arrow_temp
scoreboard players operation #doom_dz ms.arrow_temp -= #doom_oz ms.arrow_temp
execute anchored eyes positioned ^ ^ ^ run summon minecraft:arrow ~ ~ ~ {Tags:["ms_doom_n","ms_doom_spray"],pickup:0}
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[0] double 0.0002 run scoreboard players get #doom_dx ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[1] double 0.0002 run scoreboard players get #doom_dy ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[2] double 0.0002 run scoreboard players get #doom_dz ms.arrow_temp
data modify entity @e[tag=ms_doom_n,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=ms_doom_n,limit=1] weapon set from storage minesouls:doom_bow Weapon
kill @e[tag=ms_doom_h]
tag @e[tag=ms_doom_n] remove ms_doom_n

# --- Spray Arrow 4: right 5°, down 8° ---
execute anchored eyes rotated ~5 ~8 positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_doom_h"]}
execute store result score #doom_dx ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[0] 10000
execute store result score #doom_dy ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[1] 10000
execute store result score #doom_dz ms.arrow_temp run data get entity @e[tag=ms_doom_h,limit=1] Pos[2] 10000
scoreboard players operation #doom_dx ms.arrow_temp -= #doom_ox ms.arrow_temp
scoreboard players operation #doom_dy ms.arrow_temp -= #doom_oy ms.arrow_temp
scoreboard players operation #doom_dz ms.arrow_temp -= #doom_oz ms.arrow_temp
execute anchored eyes positioned ^ ^ ^ run summon minecraft:arrow ~ ~ ~ {Tags:["ms_doom_n","ms_doom_spray"],pickup:0}
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[0] double 0.0002 run scoreboard players get #doom_dx ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[1] double 0.0002 run scoreboard players get #doom_dy ms.arrow_temp
execute store result entity @e[tag=ms_doom_n,limit=1] Motion[2] double 0.0002 run scoreboard players get #doom_dz ms.arrow_temp
data modify entity @e[tag=ms_doom_n,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=ms_doom_n,limit=1] weapon set from storage minesouls:doom_bow Weapon
kill @e[tag=ms_doom_h]
tag @e[tag=ms_doom_n] remove ms_doom_n

# --- Cleanup origin marker ---
kill @e[tag=ms_doom_origin]

# --- Feedback ---
playsound minecraft:entity.arrow.shoot player @s ~ ~ ~ 1 1.5
particle minecraft:flame ~ ~1.5 ~ 0.3 0.3 0.3 0.05 10
