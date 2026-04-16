# Frosty Fire – Fire a snowball at the nearest hostile mob.
# Runs as the frosty snow golem, at the golem's position.
# Uses the marker direction trick to aim toward the nearest hostile.

# --- Compute direction toward nearest hostile via marker direction trick ---

# Store golem position (eye level ~1.5 blocks up)
execute positioned ~ ~1.5 ~ run summon minecraft:marker ~ ~ ~ {Tags:["ms_ff_origin"]}
execute store result score #ff_ox ms.spell_temp run data get entity @e[tag=ms_ff_origin,limit=1] Pos[0] 10000
execute store result score #ff_oy ms.spell_temp run data get entity @e[tag=ms_ff_origin,limit=1] Pos[1] 10000
execute store result score #ff_oz ms.spell_temp run data get entity @e[tag=ms_ff_origin,limit=1] Pos[2] 10000

# Direction marker 1 block toward nearest hostile
execute positioned ~ ~1.5 ~ facing entity @e[type=#minesouls:hostile,distance=..10,sort=nearest,limit=1] eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_ff_dir"]}
execute store result score #ff_dx ms.spell_temp run data get entity @e[tag=ms_ff_dir,limit=1] Pos[0] 10000
execute store result score #ff_dy ms.spell_temp run data get entity @e[tag=ms_ff_dir,limit=1] Pos[1] 10000
execute store result score #ff_dz ms.spell_temp run data get entity @e[tag=ms_ff_dir,limit=1] Pos[2] 10000

# Direction vector = dir - origin
scoreboard players operation #ff_dx ms.spell_temp -= #ff_ox ms.spell_temp
scoreboard players operation #ff_dy ms.spell_temp -= #ff_oy ms.spell_temp
scoreboard players operation #ff_dz ms.spell_temp -= #ff_oz ms.spell_temp

# Summon snowball with marker passenger for hit detection
execute positioned ~ ~1.5 ~ facing entity @e[type=#minesouls:hostile,distance=..10,sort=nearest,limit=1] eyes positioned ^ ^ ^1 run summon minecraft:snowball ~ ~ ~ {Tags:["ms_frosty_sb","ms_frosty_sb_new"],Passengers:[{id:"minecraft:marker",Tags:["ms_frosty_rider"]}]}

# Set Motion (scale 0.00015: ~1.5 blocks/tick speed)
execute store result entity @e[tag=ms_frosty_sb_new,limit=1] Motion[0] double 0.00015 run scoreboard players get #ff_dx ms.spell_temp
execute store result entity @e[tag=ms_frosty_sb_new,limit=1] Motion[1] double 0.00015 run scoreboard players get #ff_dy ms.spell_temp
execute store result entity @e[tag=ms_frosty_sb_new,limit=1] Motion[2] double 0.00015 run scoreboard players get #ff_dz ms.spell_temp

# Cleanup helper markers and new tag
kill @e[tag=ms_ff_origin]
kill @e[tag=ms_ff_dir]
tag @e[tag=ms_frosty_sb_new] remove ms_frosty_sb_new

# Visual feedback
playsound minecraft:entity.snowball.throw player @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:snowflake ~ ~1.5 ~ 0.2 0.2 0.2 0.05 3
