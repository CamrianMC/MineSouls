# Fireball – Mage Tier 2 Perk 1
# Launches a ball of flame that deals 4 fire damage and ignites the target hostile mob.
# Costs 40 mana. Uses the marker direction trick for look-direction projectile.

# Check mana
execute unless score @s ms.mana matches 40.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 40.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 40

# --- Compute look direction via marker direction trick ---

# Store eye position via origin marker
execute anchored eyes positioned ^ ^ ^0 run summon minecraft:marker ~ ~ ~ {Tags:["ms_fb_origin"]}
execute store result score #fb_ox ms.spell_temp run data get entity @e[tag=ms_fb_origin,limit=1] Pos[0] 10000
execute store result score #fb_oy ms.spell_temp run data get entity @e[tag=ms_fb_origin,limit=1] Pos[1] 10000
execute store result score #fb_oz ms.spell_temp run data get entity @e[tag=ms_fb_origin,limit=1] Pos[2] 10000

# Direction marker 1 block ahead in look direction
execute anchored eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_fb_dir"]}
execute store result score #fb_dx ms.spell_temp run data get entity @e[tag=ms_fb_dir,limit=1] Pos[0] 10000
execute store result score #fb_dy ms.spell_temp run data get entity @e[tag=ms_fb_dir,limit=1] Pos[1] 10000
execute store result score #fb_dz ms.spell_temp run data get entity @e[tag=ms_fb_dir,limit=1] Pos[2] 10000

# Direction vector = dir - origin
scoreboard players operation #fb_dx ms.spell_temp -= #fb_ox ms.spell_temp
scoreboard players operation #fb_dy ms.spell_temp -= #fb_oy ms.spell_temp
scoreboard players operation #fb_dz ms.spell_temp -= #fb_oz ms.spell_temp

# Summon fireball ahead with marker passenger for hit detection
execute anchored eyes positioned ^ ^ ^ run summon minecraft:small_fireball ~ ~ ~ {Tags:["ms_spell_fireball","ms_fb_new"],Passengers:[{id:"minecraft:marker",Tags:["ms_fb_rider"]}]}

# Set Motion on the snowball (scale 0.0002: ~2.0 blocks/tick speed)
execute store result entity @e[tag=ms_fb_new,limit=1] Motion[0] double 0.0002 run scoreboard players get #fb_dx ms.spell_temp
execute store result entity @e[tag=ms_fb_new,limit=1] Motion[1] double 0.0002 run scoreboard players get #fb_dy ms.spell_temp
execute store result entity @e[tag=ms_fb_new,limit=1] Motion[2] double 0.0002 run scoreboard players get #fb_dz ms.spell_temp

# Set Owner to prevent self-collision
data modify entity @e[tag=ms_fb_new,limit=1] Owner set from entity @s UUID

# Cleanup helper markers and new tag
kill @e[tag=ms_fb_origin]
kill @e[tag=ms_fb_dir]
tag @e[tag=ms_fb_new] remove ms_fb_new

# Feedback
playsound minecraft:entity.blaze.shoot player @s ~ ~ ~ 1 1
particle minecraft:flame ~ ~1.5 ~ 0.2 0.2 0.2 0.05 10
