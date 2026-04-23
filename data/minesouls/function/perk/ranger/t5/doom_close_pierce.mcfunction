# Doom – Piercing Shot helper for close-range hit.
# Called from doom_close_hit when the Ranger has T3 Perk 2 (Piercing Shot).
# Spawns an arrow continuing past the ms_doom_target, with Owner and weapon set.
# Follows the same direction trick as piercing_shot_hit.mcfunction.

# Bail if no target
execute unless entity @e[tag=ms_doom_target,limit=1] run return 0

# --- Compute flight direction (player → target) ---
execute facing entity @e[tag=ms_doom_target,limit=1] feet run summon minecraft:marker ^ ^ ^1 {Tags:["ms_doom_pierce_helper"]}

execute store result score #ps_px ms.arrow_temp run data get entity @s Pos[0] 10000
execute store result score #ps_py ms.arrow_temp run data get entity @s Pos[1] 10000
execute store result score #ps_pz ms.arrow_temp run data get entity @s Pos[2] 10000

execute store result score #ps_hx ms.arrow_temp run data get entity @e[tag=ms_doom_pierce_helper,limit=1] Pos[0] 10000
execute store result score #ps_hy ms.arrow_temp run data get entity @e[tag=ms_doom_pierce_helper,limit=1] Pos[1] 10000
execute store result score #ps_hz ms.arrow_temp run data get entity @e[tag=ms_doom_pierce_helper,limit=1] Pos[2] 10000

scoreboard players operation #ps_hx ms.arrow_temp -= #ps_px ms.arrow_temp
scoreboard players operation #ps_hy ms.arrow_temp -= #ps_py ms.arrow_temp
scoreboard players operation #ps_hz ms.arrow_temp -= #ps_pz ms.arrow_temp

# Spawn arrow 0.5 blocks past the target's centre mass, continuing the flight path
execute at @e[tag=ms_doom_target,limit=1] positioned ~ ~1 ~ facing entity @s eyes run summon minecraft:arrow ^ ^ ^-0.5 {Tags:["ms_doom_pierce_new","ms_doom_spray"],pickup:0}

execute store result entity @e[tag=ms_doom_pierce_new,limit=1] Motion[0] double 0.0002 run scoreboard players get #ps_hx ms.arrow_temp
execute store result entity @e[tag=ms_doom_pierce_new,limit=1] Motion[1] double 0.0002 run scoreboard players get #ps_hy ms.arrow_temp
execute store result entity @e[tag=ms_doom_pierce_new,limit=1] Motion[2] double 0.0002 run scoreboard players get #ps_hz ms.arrow_temp

# Set Owner and weapon so the piercing arrow triggers perks + enchantments on hit
data modify entity @e[tag=ms_doom_pierce_new,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=ms_doom_pierce_new,limit=1] weapon set from storage minesouls:doom_bow Weapon

# Cleanup
kill @e[tag=ms_doom_pierce_helper]
tag @e[tag=ms_doom_pierce_new] remove ms_doom_pierce_new

# Feedback
playsound minecraft:entity.arrow.shoot player @s ~ ~ ~ 0.8 1.8
execute at @e[tag=ms_doom_target,limit=1] run particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.2 10
