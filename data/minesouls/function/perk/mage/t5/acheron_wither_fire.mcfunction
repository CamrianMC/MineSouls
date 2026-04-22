# Acheron Wither Fire – Launch a wither skull toward the nearest hostile within 50 blocks.
# Runs as the acheron wither, at the wither's position.
# Uses the marker direction trick to aim at the target (same pattern as frosty_fire).

# --- Compute direction toward nearest hostile via marker direction trick ---

# Store wither origin position (eye level ~1.5 blocks up)
execute positioned ~ ~1.5 ~ run summon minecraft:marker ~ ~ ~ {Tags:["ms_aw_origin"]}
execute store result score #aw_ox ms.spell_temp run data get entity @e[tag=ms_aw_origin,limit=1] Pos[0] 10000
execute store result score #aw_oy ms.spell_temp run data get entity @e[tag=ms_aw_origin,limit=1] Pos[1] 10000
execute store result score #aw_oz ms.spell_temp run data get entity @e[tag=ms_aw_origin,limit=1] Pos[2] 10000

# Direction marker 1 block toward nearest hostile within 50 blocks
execute positioned ~ ~1.5 ~ facing entity @e[type=#minesouls:hostile,distance=..50,sort=nearest,limit=1] eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_aw_dir"]}
execute store result score #aw_dx ms.spell_temp run data get entity @e[tag=ms_aw_dir,limit=1] Pos[0] 10000
execute store result score #aw_dy ms.spell_temp run data get entity @e[tag=ms_aw_dir,limit=1] Pos[1] 10000
execute store result score #aw_dz ms.spell_temp run data get entity @e[tag=ms_aw_dir,limit=1] Pos[2] 10000

# Direction vector = dir - origin
scoreboard players operation #aw_dx ms.spell_temp -= #aw_ox ms.spell_temp
scoreboard players operation #aw_dy ms.spell_temp -= #aw_oy ms.spell_temp
scoreboard players operation #aw_dz ms.spell_temp -= #aw_oz ms.spell_temp

# Summon a wither skull at the wither's eye level
execute positioned ~ ~1.5 ~ run summon minecraft:wither_skull ~ ~ ~ {Tags:["ms_acheron_skull","ms_acheron_skull_new"],dangerous:0b}

# Set Motion (scale 0.00015: ~1.5 blocks/tick speed)
execute store result entity @e[tag=ms_acheron_skull_new,limit=1] Motion[0] double 0.00015 run scoreboard players get #aw_dx ms.spell_temp
execute store result entity @e[tag=ms_acheron_skull_new,limit=1] Motion[1] double 0.00015 run scoreboard players get #aw_dy ms.spell_temp
execute store result entity @e[tag=ms_acheron_skull_new,limit=1] Motion[2] double 0.00015 run scoreboard players get #aw_dz ms.spell_temp

# Cleanup helper markers and new tag
kill @e[tag=ms_aw_origin]
kill @e[tag=ms_aw_dir]
tag @e[tag=ms_acheron_skull_new] remove ms_acheron_skull_new

# Sound feedback
playsound minecraft:entity.wither.shoot player @a[distance=..64] ~ ~ ~ 1 1
