# Piercing Shot – Ranger Tier 3 Perk 2
# Arrows pass through enemies: spawn a new arrow behind the hit mob
# continuing in the same direction with equivalent velocity.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/ranger/t3/piercing_shot

# Tag the hit entity
tag @e[type=!minecraft:player,nbt={HurtTime:10s},sort=nearest,distance=..64,limit=1] add ms_pierce_target

# Bail out if no target found
execute unless entity @e[tag=ms_pierce_target,limit=1] run return 0

# --- Compute flight direction (player → target) ---
# Summon a helper marker 1 block from the player toward the target
execute facing entity @e[tag=ms_pierce_target,limit=1] feet run summon minecraft:marker ^ ^ ^1 {Tags:["ms_pierce_helper"]}

# Store player position (scaled x10000)
execute store result score #ps_px ms.arrow_temp run data get entity @s Pos[0] 10000
execute store result score #ps_py ms.arrow_temp run data get entity @s Pos[1] 10000
execute store result score #ps_pz ms.arrow_temp run data get entity @s Pos[2] 10000

# Store helper position (1 block from player toward target)
execute store result score #ps_hx ms.arrow_temp run data get entity @e[tag=ms_pierce_helper,limit=1] Pos[0] 10000
execute store result score #ps_hy ms.arrow_temp run data get entity @e[tag=ms_pierce_helper,limit=1] Pos[1] 10000
execute store result score #ps_hz ms.arrow_temp run data get entity @e[tag=ms_pierce_helper,limit=1] Pos[2] 10000

# Direction = helper - player (unit vector * 10000)
scoreboard players operation #ps_hx ms.arrow_temp -= #ps_px ms.arrow_temp
scoreboard players operation #ps_hy ms.arrow_temp -= #ps_py ms.arrow_temp
scoreboard players operation #ps_hz ms.arrow_temp -= #ps_pz ms.arrow_temp

# Spawn new arrow 1.5 blocks past the target (away from the player)
# At the target's position, "facing entity @s eyes" rotates toward the player
# (@s is still the player in this context); ^ ^ ^-1.5 goes the opposite way,
# i.e. 1.5 blocks continuing the arrow's original flight path.
execute at @e[tag=ms_pierce_target,limit=1] facing entity @s eyes run summon minecraft:arrow ^ ^ ^-1.5 {Tags:["ms_pierce_new","ms_rico_fired"],pickup:0}

# Set Motion on the new arrow: direction * 0.0002 = ~2.0 blocks/tick speed
execute store result entity @e[tag=ms_pierce_new,limit=1] Motion[0] double 0.0002 run scoreboard players get #ps_hx ms.arrow_temp
execute store result entity @e[tag=ms_pierce_new,limit=1] Motion[1] double 0.0002 run scoreboard players get #ps_hy ms.arrow_temp
execute store result entity @e[tag=ms_pierce_new,limit=1] Motion[2] double 0.0002 run scoreboard players get #ps_hz ms.arrow_temp

# Clean up
kill @e[tag=ms_pierce_helper]
tag @e[tag=ms_pierce_new] remove ms_pierce_new
tag @e[tag=ms_pierce_target] remove ms_pierce_target

# Feedback
playsound minecraft:entity.arrow.shoot player @s ~ ~ ~ 0.8 1.8
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.2 10
