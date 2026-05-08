# Knight Artorias – Chase Movement (state 0)
# Faces and moves toward the nearest player each tick.
# Speed: 0.35 blocks/tick in phase 1, 0.55 in phase 2.
# Runs as the base entity (vindicator) at its position.

# Apply idle armor stand pose while chasing
function minesouls:artorias/visual/pose_idle

# Tag the nearest player as the chase target
tag @a[distance=..60,sort=nearest,limit=1] add ms_arta_chase_target

# If no target found, nothing to do
execute unless entity @a[tag=ms_arta_chase_target] run return 0

# Phase 1 movement: face and advance 0.35 blocks toward target
execute if score @s ms.arta_phase matches 1 if entity @a[tag=ms_arta_chase_target] facing entity @a[tag=ms_arta_chase_target] eyes run teleport @s ^ ^ ^0.35 facing entity @a[tag=ms_arta_chase_target] eyes

# Phase 2 movement: face and advance 0.55 blocks toward target (faster)
execute if score @s ms.arta_phase matches 2 if entity @a[tag=ms_arta_chase_target] facing entity @a[tag=ms_arta_chase_target] eyes run teleport @s ^ ^ ^0.55 facing entity @a[tag=ms_arta_chase_target] eyes

tag @a[tag=ms_arta_chase_target] remove ms_arta_chase_target
