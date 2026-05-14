# Dark Ball Fire – summons one descending dark energy ball at a random spot
# within 5 blocks of Manus whenever he moves.  The ball is a visual telegraph;
# mechanical damage is dealt by dark_ball_hit after the descent timer expires.
# Runs as Manus at Manus (called from move.mcfunction after the teleport).

# Spawn a pool of 12 candidate positions around Manus at Y+6 for visual height.
# All candidates are within 5 blocks of Manus horizontally.
summon minecraft:marker ~3 ~6 ~0 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~-3 ~6 ~0 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~0 ~6 ~3 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~0 ~6 ~-3 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~4 ~6 ~0 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~-4 ~6 ~0 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~0 ~6 ~4 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~0 ~6 ~-4 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~3 ~6 ~3 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~-3 ~6 ~3 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~3 ~6 ~-3 {Tags:["ms_manus_dark_cand"]}
summon minecraft:marker ~-3 ~6 ~-3 {Tags:["ms_manus_dark_cand"]}

# Promote one randomly chosen candidate to the active dark energy ball
tag @e[tag=ms_manus_dark_cand,sort=random,limit=1] add ms_manus_dark_ball

# Assign a random descent timer: 50% chance of 60 ticks (fast), 50% chance of 70 ticks (slow).
# random value 1..2 gives a uniform coin-flip: 1 → 60, 2 → 70.
# (random value 60..70 would give a uniform spread across 11 values, not a 50/50 binary split.)
execute as @e[tag=ms_manus_dark_ball,limit=1] store result score @s ms.manus_dark_timer run random value 1..2
execute as @e[tag=ms_manus_dark_ball,limit=1] if score @s ms.manus_dark_timer matches 1 run scoreboard players set @s ms.manus_dark_timer 60
execute as @e[tag=ms_manus_dark_ball,limit=1] if score @s ms.manus_dark_timer matches 2 run scoreboard players set @s ms.manus_dark_timer 70

# Kill the 11 unselected candidates
tag @e[tag=ms_manus_dark_ball] remove ms_manus_dark_cand
kill @e[tag=ms_manus_dark_cand]

# Ominous audio cue – deep rumble to alert players
execute at @e[tag=ms_manus_dark_ball,limit=1] run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..80] ~ ~ ~ 0.9 0.6
