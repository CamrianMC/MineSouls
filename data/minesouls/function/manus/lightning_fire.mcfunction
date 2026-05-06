# Lightning Fire – reset timer and summon 3 warning markers at random positions near Manus.
# Runs as Manus at Manus.

# Reset the lightning strike cooldown (60 ticks = 3 seconds)
scoreboard players set @s ms.manus_lightning_timer 60

# Summon a pool of 12 candidate positions arranged around Manus at ground level.
# Using a mix of cardinal, diagonal, and offset distances for spread variety.
summon minecraft:marker ~8 ~0 ~0 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-8 ~0 ~0 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~0 ~0 ~8 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~0 ~0 ~-8 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~6 ~0 ~6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-6 ~0 ~6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~6 ~0 ~-6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-6 ~0 ~-6 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~10 ~0 ~4 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~-10 ~0 ~4 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~4 ~0 ~10 {Tags:["ms_manus_lightning_cand"]}
summon minecraft:marker ~4 ~0 ~-10 {Tags:["ms_manus_lightning_cand"]}

# Promote 3 randomly chosen candidates to warning markers and start their 30-tick countdown.
# sort=random gives true random selection from the 12 candidates each time.
tag @e[tag=ms_manus_lightning_cand,sort=random,limit=3] add ms_manus_lightning_warn
scoreboard players set @e[tag=ms_manus_lightning_warn] ms.manus_lw_timer 30

# Kill the 9 unselected candidates
tag @e[tag=ms_manus_lightning_warn] remove ms_manus_lightning_cand
kill @e[tag=ms_manus_lightning_cand]

# Ominous audio cue – rising electric charge
execute at @s run playsound minecraft:entity.warden.sonic_charge hostile @a[distance=..80] ~ ~ ~ 0.8 1.3
