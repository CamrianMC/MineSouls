# Knight Artorias – Somersault Slam: Shockwave
# Called once on slam impact. Deals burst damage and spawns timed ring markers.
# Runs as the base entity at its position.

# Close-range burst: all players within 5 blocks take heavy damage + knockback
execute as @a[distance=..5] run damage @s 25 minecraft:player_attack
execute as @a[distance=..5] run effect give @s minecraft:slowness 30 1 true

# Mid ring: 5–9 blocks (spawn 8 markers in a ring; they deal damage on landing)
summon minecraft:marker ~5  ~0 ~0  {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~-5 ~0 ~0  {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~0  ~0 ~5  {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~0  ~0 ~-5 {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~4  ~0 ~4  {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~-4 ~0 ~4  {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~4  ~0 ~-4 {Tags:["ms_arta_shockwave"]}
summon minecraft:marker ~-4 ~0 ~-4 {Tags:["ms_arta_shockwave"]}

# Outer ring: 9–13 blocks (slightly weaker, 10-tick delay)
summon minecraft:marker ~9  ~0 ~0  {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~-9 ~0 ~0  {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~0  ~0 ~9  {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~0  ~0 ~-9 {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~7  ~0 ~7  {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~-7 ~0 ~7  {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~7  ~0 ~-7 {Tags:["ms_arta_shockwave_outer"]}
summon minecraft:marker ~-7 ~0 ~-7 {Tags:["ms_arta_shockwave_outer"]}

# Set lifetime counters on the ring markers
scoreboard players set @e[tag=ms_arta_shockwave] ms.arta_temp 10
scoreboard players set @e[tag=ms_arta_shockwave_outer] ms.arta_temp 20

# Phase 2: stronger shockwave – extra outer damage
execute if score @s ms.arta_phase matches 2 as @a[distance=..9] run damage @s 12 minecraft:player_attack
