# Lightning Fire – reset timer and summon 3 warning markers at random positions near Manus.
# Runs as Manus at Manus.

# Reset the lightning strike cooldown (60 ticks = 3 seconds)
scoreboard players set @s ms.manus_lightning_timer 60

# Summon a pool of 12 candidate positions arranged around Manus at ground level.
# Using a mix of cardinal, diagonal, and offset distances for spread variety.
summon minecraft:marker ~6 ~0 ~0 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-6 ~0 ~0 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~0 ~0 ~6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~0 ~0 ~-6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~4 ~0 ~4 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-4 ~0 ~4 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~4 ~0 ~-4 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-4 ~0 ~-4 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~6 ~0 ~3 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-6 ~0 ~3 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~3 ~0 ~6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~3 ~0 ~-6 {Tags:["ms_manus_lightning_cand"]}

# Promote randomly chosen candidates to warning markers and start their 30-tick countdown.
# Phase 1: 3 strikes. Phase 2: 6 strikes.
# sort=random gives true random selection from the 12 candidates each time.
execute if score @s ms.manus_phase matches 1 run tag @e[tag=ms_manus_lightning_cand,sort=random,limit=3] add ms_manus_lightning_warn
execute if score @s ms.manus_phase matches 2 run tag @e[tag=ms_manus_lightning_cand,sort=random,limit=6] add ms_manus_lightning_warn
scoreboard players set @e[tag=ms_manus_lightning_warn] ms.manus_lw_timer 30

# Kill the 9 unselected candidates
tag @e[tag=ms_manus_lightning_warn] remove ms_manus_lightning_cand
kill @e[tag=ms_manus_lightning_cand]

# Ominous audio cue – rising electric charge
execute at @s run playsound minecraft:entity.warden.sonic_charge hostile @a[distance=..80] ~ ~ ~ 0.8 1.3
