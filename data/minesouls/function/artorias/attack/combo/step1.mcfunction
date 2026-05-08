# Knight Artorias – Abyss Combo: Step 1 – Quick Slash (state 8)
# Fast rightward horizontal slash with a narrow forward hitbox.
# Phase 1: 10-tick window  |  Phase 2: 7-tick window
# Runs as the base entity at its position.

# Apply combo step 1 pose
function minesouls:artorias/visual/pose_combo1

# Tick 1: slash sound + small nudge toward player
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.player.attack.sweep hostile @a[distance=..40] ~ ~ ~ 1 1.2
execute if score @s ms.arta_timer matches 1 run particle minecraft:sweep_attack ~ ~1 ~ 0.6 0.4 0.6 0.05 6 normal
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 1 run teleport @s ^ ^ ^0.5
execute if score @s ms.arta_timer matches 1 if score @s ms.arta_phase matches 2 run teleport @s ^ ^ ^0.7

# Hit check on tick 1: forward cone (2.5 blocks in front + body)
execute if score @s ms.arta_timer matches 1 run execute as @a[distance=..2.5] run damage @s 12 minecraft:player_attack
execute if score @s ms.arta_timer matches 1 run execute positioned ^ ^ ^1.5 as @a[distance=..2] run damage @s 12 minecraft:player_attack

# Wither on hit
execute if score @s ms.arta_timer matches 1 run execute as @a[distance=..2.5] run effect give @s minecraft:wither 2 0 true
execute if score @s ms.arta_timer matches 1 run execute positioned ^ ^ ^1.5 as @a[distance=..2] run effect give @s minecraft:wither 2 0 true

# Phase 1: transition after 10 ticks  |  Phase 2: after 7 ticks
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_state 9
execute if score @s ms.arta_phase matches 1 if score @s ms.arta_timer matches 10.. run scoreboard players set @s ms.arta_timer 0
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 7.. run scoreboard players set @s ms.arta_state 9
execute if score @s ms.arta_phase matches 2 if score @s ms.arta_timer matches 7.. run scoreboard players set @s ms.arta_timer 0
