# Skull Fire Aimed – runs as Manus with rotation already pointing toward the target player.
# Uses the marker direction trick (same pattern as mage fireball perk) to compute the
# look-direction vector, then summons a wither skull with the corresponding Motion.

# --- Marker direction trick: derive unit direction from eye-space markers ---

# Origin: Manus' eye position
execute anchored feet positioned ^ ^ ^0 run summon minecraft:marker ~ ~ ~ {Tags:["ms_manus_sk_origin"]}
execute store result score #sk_ox ms.manus_temp run data get entity @e[tag=ms_manus_sk_origin,limit=1] Pos[0] 10000
execute store result score #sk_oy ms.manus_temp run data get entity @e[tag=ms_manus_sk_origin,limit=1] Pos[1] 10000
execute store result score #sk_oz ms.manus_temp run data get entity @e[tag=ms_manus_sk_origin,limit=1] Pos[2] 10000

# Direction: 1 block ahead of Manus' eyes in look direction
execute anchored feet positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_manus_sk_dir"]}
execute store result score #sk_dx ms.manus_temp run data get entity @e[tag=ms_manus_sk_dir,limit=1] Pos[0] 10000
execute store result score #sk_dy ms.manus_temp run data get entity @e[tag=ms_manus_sk_dir,limit=1] Pos[1] 10000
execute store result score #sk_dz ms.manus_temp run data get entity @e[tag=ms_manus_sk_dir,limit=1] Pos[2] 10000

# Direction vector = direction marker – origin marker
scoreboard players operation #sk_dx ms.manus_temp -= #sk_ox ms.manus_temp
scoreboard players operation #sk_dy ms.manus_temp -= #sk_oy ms.manus_temp
scoreboard players operation #sk_dz ms.manus_temp -= #sk_oz ms.manus_temp

# Summon the wither skull 1.5 blocks ahead of Manus' eyes to clear his hitbox
execute anchored feet positioned ^ ^0.5 ^1.5 run summon minecraft:wither_skull ~ ~ ~ {Tags:["ms_manus_skull_new"],Charged:0b}

# Set Motion: scale 0.0001 × 10000-unit direction = ~1.0 blocks/tick initial speed (slower, more dodgeable)
execute store result entity @e[tag=ms_manus_skull_new,limit=1] Motion[0] double 0.0001 run scoreboard players get #sk_dx ms.manus_temp
execute store result entity @e[tag=ms_manus_skull_new,limit=1] Motion[1] double 0.0001 run scoreboard players get #sk_dy ms.manus_temp
execute store result entity @e[tag=ms_manus_skull_new,limit=1] Motion[2] double 0.0001 run scoreboard players get #sk_dz ms.manus_temp

# Set Owner to Manus' UUID so the skull does not collide with its own shooter
data modify entity @e[tag=ms_manus_skull_new,limit=1] Owner set from entity @s UUID

# Cleanup helper markers and temporary spawn tag
kill @e[tag=ms_manus_sk_origin]
kill @e[tag=ms_manus_sk_dir]
tag @e[tag=ms_manus_skull_new] remove ms_manus_skull_new

# Audio cue so players know a skull has been fired
execute at @s run playsound minecraft:entity.wither.shoot hostile @a[distance=..80] ~ ~ ~ 1 0.9
