# Snowball – Mage Tier 1 Perk 1
# Launches a snowball projectile that deals 2 damage on hit. Costs 20 mana.
# Uses the marker direction trick to set snowball Motion in the player's look direction.

# Check mana
execute unless score @s ms.mana matches 20.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 20.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 20

# --- Compute look direction via marker direction trick ---

# Store eye position via origin marker
execute anchored eyes run summon minecraft:marker ~ ~ ~ {Tags:["ms_sb_origin"]}
execute store result score #sb_ox ms.spell_temp run data get entity @e[tag=ms_sb_origin,limit=1] Pos[0] 10000
execute store result score #sb_oy ms.spell_temp run data get entity @e[tag=ms_sb_origin,limit=1] Pos[1] 10000
execute store result score #sb_oz ms.spell_temp run data get entity @e[tag=ms_sb_origin,limit=1] Pos[2] 10000

# Direction marker 1 block ahead in look direction
execute anchored eyes positioned ^ ^ ^1 run summon minecraft:marker ~ ~ ~ {Tags:["ms_sb_dir"]}
execute store result score #sb_dx ms.spell_temp run data get entity @e[tag=ms_sb_dir,limit=1] Pos[0] 10000
execute store result score #sb_dy ms.spell_temp run data get entity @e[tag=ms_sb_dir,limit=1] Pos[1] 10000
execute store result score #sb_dz ms.spell_temp run data get entity @e[tag=ms_sb_dir,limit=1] Pos[2] 10000

# Direction vector = dir - origin
scoreboard players operation #sb_dx ms.spell_temp -= #sb_ox ms.spell_temp
scoreboard players operation #sb_dy ms.spell_temp -= #sb_oy ms.spell_temp
scoreboard players operation #sb_dz ms.spell_temp -= #sb_oz ms.spell_temp

# Summon snowball 1.5 blocks ahead with marker passenger for hit detection
execute anchored eyes positioned ^ ^ ^1.5 run summon minecraft:snowball ~ ~ ~ {Tags:["ms_spell_snowball","ms_sb_new"],Passengers:[{id:"minecraft:marker",Tags:["ms_sb_rider"]}]}

# Set Motion on the snowball (scale 0.0002: direction * 10000 * 0.0002 = ~2.0 blocks/tick speed)
execute store result entity @e[tag=ms_sb_new,limit=1] Motion[0] double 0.0002 run scoreboard players get #sb_dx ms.spell_temp
execute store result entity @e[tag=ms_sb_new,limit=1] Motion[1] double 0.0002 run scoreboard players get #sb_dy ms.spell_temp
execute store result entity @e[tag=ms_sb_new,limit=1] Motion[2] double 0.0002 run scoreboard players get #sb_dz ms.spell_temp

# Set Owner to prevent self-collision
data modify entity @e[tag=ms_sb_new,limit=1] Owner set from entity @s UUID

# Cleanup helper markers and new tag
kill @e[tag=ms_sb_origin]
kill @e[tag=ms_sb_dir]
tag @e[tag=ms_sb_new] remove ms_sb_new

# Feedback
playsound minecraft:entity.snowball.throw player @s ~ ~ ~ 1 1
particle minecraft:snowflake ~ ~1.5 ~ 0.2 0.2 0.2 0.05 5
