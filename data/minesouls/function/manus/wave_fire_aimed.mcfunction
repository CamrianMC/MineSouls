# Wave Fire Aimed – runs as Manus with rotation already pointing toward the target player.
# Fires a large_fireball (no gravity, ExplosionPower:0 prevents block destruction) at
# reduced speed so players can strafe out of its path.  A marker passenger (orphan-rider
# trick) lets wave_tick.mcfunction detect the hit and apply massive custom damage.

# --- Marker direction trick ---

execute anchored eyes positioned ^ ^ ^0 run summon minecraft:marker ~ ~ ~ {Tags:["ms_manus_wv_origin"]}
execute store result score #wv_ox ms.manus_temp run data get entity @e[tag=ms_manus_wv_origin,limit=1] Pos[0] 10000
execute store result score #wv_oy ms.manus_temp run data get entity @e[tag=ms_manus_wv_origin,limit=1] Pos[1] 10000
execute store result score #wv_oz ms.manus_temp run data get entity @e[tag=ms_manus_wv_origin,limit=1] Pos[2] 10000

execute anchored eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_manus_wv_dir"]}
execute store result score #wv_dx ms.manus_temp run data get entity @e[tag=ms_manus_wv_dir,limit=1] Pos[0] 10000
execute store result score #wv_dy ms.manus_temp run data get entity @e[tag=ms_manus_wv_dir,limit=1] Pos[1] 10000
execute store result score #wv_dz ms.manus_temp run data get entity @e[tag=ms_manus_wv_dir,limit=1] Pos[2] 10000

scoreboard players operation #wv_dx ms.manus_temp -= #wv_ox ms.manus_temp
scoreboard players operation #wv_dy ms.manus_temp -= #wv_oy ms.manus_temp
scoreboard players operation #wv_dz ms.manus_temp -= #wv_oz ms.manus_temp

# Summon the wave fireball 1.5 blocks ahead of Manus' eyes to clear his hitbox.
# ExplosionPower:0b prevents block destruction.
# The marker passenger will become orphaned (lose its vehicle) when the fireball hits
# something, triggering custom damage logic in wave_tick.mcfunction.
execute anchored eyes positioned ^ ^ ^1.5 run summon minecraft:fireball ~ ~ ~ {Tags:["ms_manus_wave_new"],ExplosionPower:0b,Passengers:[{id:"minecraft:marker",Tags:["ms_manus_wave_rider"]}]}

# Set Motion: scale 0.0001 × 10000-unit direction = ~1.0 blocks/tick initial speed.
# AbstractHurtingProjectile applies 0.95 drag per tick, so the fireball decelerates
# naturally – it reaches ~25 blocks before stopping, keeping it visually "slow" while
# still threatening players at typical fight distance.
execute store result entity @e[tag=ms_manus_wave_new,limit=1] Motion[0] double 0.0001 run scoreboard players get #wv_dx ms.manus_temp
execute store result entity @e[tag=ms_manus_wave_new,limit=1] Motion[1] double 0.0001 run scoreboard players get #wv_dy ms.manus_temp
execute store result entity @e[tag=ms_manus_wave_new,limit=1] Motion[2] double 0.0001 run scoreboard players get #wv_dz ms.manus_temp

# Set Owner so the fireball does not immediately damage Manus himself
data modify entity @e[tag=ms_manus_wave_new,limit=1] Owner set from entity @s UUID

# Cleanup helper markers and temporary spawn tag
kill @e[tag=ms_manus_wv_origin]
kill @e[tag=ms_manus_wv_dir]
tag @e[tag=ms_manus_wave_new] remove ms_manus_wave_new

# Distinct audio cue – deep, ominous sound to distinguish from the skull attack
execute at @s run playsound minecraft:entity.elder_guardian.curse hostile @a[distance=..80] ~ ~ ~ 1 0.5
execute at @s run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..80] ~ ~ ~ 0.6 0.6
