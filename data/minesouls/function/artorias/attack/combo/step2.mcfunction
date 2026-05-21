# Knight Artorias – Abyss Combo: Step 2 – Reverse Slash (state 9)
# Backhand sweep from the opposite direction.
# Phase 1: 10-tick window  |  Phase 2: 7-tick window
# Runs as the base entity at its position.

# Apply combo step 2 pose
function minesouls:artorias/visual/pose_combo2

# Tick 1: reverse slash sound + small lateral nudge
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.player.attack.crit hostile @a[distance=..40] ~ ~ ~ 1 0.9
execute if score @s ms.arta_timer matches 1 run particle minecraft:sweep_attack ~ ~1 ~ 0.6 0.4 0.6 0.05 6 normal
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 1 run teleport @s ^ ^ ^0.5
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 2 run teleport @s ^ ^ ^0.7

# Hit check on tick 1
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 1 as @a[distance=..2.5] run damage @s 12 minecraft:player_attack
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 2 as @a[distance=..2.5] run damage @s 24 minecraft:player_attack
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 1 positioned ^ ^ ^1.5 as @a[distance=..2] run damage @s 12 minecraft:player_attack
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 2 positioned ^ ^ ^1.5 as @a[distance=..2] run damage @s 24 minecraft:player_attack

# Wither on hit
execute if score @s ms.arta_timer matches 1 as @a[distance=..2.5] run effect give @s minecraft:wither 2 0 true
execute if score @s ms.arta_timer matches 1 positioned ^ ^ ^1.5 as @a[distance=..2] run effect give @s minecraft:wither 2 0 true

# Phase 1: transition after 10 ticks  |  Phase 2: after 7 ticks
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_state 10
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 7.. run scoreboard players set @s ms.arta_state 10
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 7.. run scoreboard players set @s ms.arta_timer 0
