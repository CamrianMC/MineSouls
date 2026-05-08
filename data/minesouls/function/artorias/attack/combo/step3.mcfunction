# Knight Artorias – Abyss Combo: Step 3 – Heavy Overhead Strike (state 10)
# Powerful overhead smash that plants a delayed "Abyss rupture" at the hit location.
# Phase 1: 15-tick window  |  Phase 2: 10-tick window
# Runs as the base entity at its position.

# Apply combo step 3 pose
function minesouls:artorias/visual/pose_combo3

# Tick 1: heavy strike sound + overhead slam particles
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.player.attack.knockback hostile @a[distance=..50] ~ ~ ~ 1 0.6
execute if score @s ms.arta_timer matches 1 run particle minecraft:explosion ~ ~1 ~ 0.4 0.5 0.4 0.05 5 normal
execute if score @s ms.arta_timer matches 1 run particle minecraft:squid_ink ~ ~1 ~ 0.5 0.7 0.5 0.04 12 normal

# Hit check on tick 1: wider hitbox (3 blocks) for the heavy overhead
execute if score @s ms.arta_timer matches 1 run execute as @a[distance=..3] run damage @s 20 minecraft:player_attack
execute if score @s ms.arta_timer matches 1 run execute positioned ^ ^ ^1.5 as @a[distance=..2.5] run damage @s 20 minecraft:player_attack

# Wither + slowness on the heavy hit
execute if score @s ms.arta_timer matches 1 run execute as @a[distance=..3] run effect give @s minecraft:wither 4 0 true
execute if score @s ms.arta_timer matches 1 run execute as @a[distance=..3] run effect give @s minecraft:slowness 40 1 true
execute if score @s ms.arta_timer matches 1 run execute positioned ^ ^ ^1.5 as @a[distance=..2.5] run effect give @s minecraft:wither 4 0 true

# Tick 3: plant a rupture marker at this position (delayed Abyss burst)
execute if score @s ms.arta_timer matches 3 run summon minecraft:marker ~ ~ ~ {Tags:["ms_arta_rupture","ms_arta_rupture_new"]}
execute if score @s ms.arta_timer matches 3 run scoreboard players set @e[tag=ms_arta_rupture_new] ms.arta_temp 20
execute if score @s ms.arta_timer matches 3 run tag @e[tag=ms_arta_rupture_new] remove ms_arta_rupture_new
execute if score @s ms.arta_timer matches 3 run particle minecraft:sculk_soul ~ ~ ~ 0.8 0.3 0.8 0.05 20 normal

# Phase 1: transition after 15 ticks  |  Phase 2: after 10 ticks
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 15.. run scoreboard players set @s ms.arta_state 11
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 15.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_state 11
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_timer 0
