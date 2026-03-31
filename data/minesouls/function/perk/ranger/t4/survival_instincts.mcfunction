# Survival Instincts – Ranger Tier 4 Perk 1
# While sneaking: hostile mobs within 20 blocks get glowing (visible through walls).
# While sneaking and stationary for 5 seconds: reveal approximate distance to nearest bonfire.

# --- Not sneaking: clean up and exit ---
execute unless predicate minesouls:is_sneaking if entity @s[tag=ms_si_active] run tag @s remove ms_si_active
execute unless predicate minesouls:is_sneaking run scoreboard players set @s ms.si_timer 0
execute unless predicate minesouls:is_sneaking run return 0

# --- Sneaking: apply glowing to nearby hostiles ---
tag @s add ms_si_active
execute as @e[type=#minesouls:hostile,distance=..20] run effect give @s minecraft:glowing 2 0 true
execute as @e[type=#minesouls:hostile,distance=..20] run tag @s add ms_si_glowing

# --- Stationary detection (same pattern as Focused T1P1) ---
tag @s remove ms_si_moved

scoreboard players operation @s ms.si_temp = @s ms.si_x
execute store result score @s ms.si_x run data get entity @s Pos[0] 100
execute unless score @s ms.si_temp = @s ms.si_x run tag @s add ms_si_moved

scoreboard players operation @s ms.si_temp = @s ms.si_y
execute store result score @s ms.si_y run data get entity @s Pos[1] 100
execute unless score @s ms.si_temp = @s ms.si_y run tag @s add ms_si_moved

scoreboard players operation @s ms.si_temp = @s ms.si_z
execute store result score @s ms.si_z run data get entity @s Pos[2] 100
execute unless score @s ms.si_temp = @s ms.si_z run tag @s add ms_si_moved

# If moved: reset timer
execute if entity @s[tag=ms_si_moved] run scoreboard players set @s ms.si_timer 0

# Increment stationary timer
scoreboard players add @s ms.si_timer 1

# At 100 ticks (5 seconds): locate the nearest bonfire and show distance
execute if score @s ms.si_timer matches 100 run function minesouls:perk/ranger/t4/survival_instincts_locate

# Subtle feedback while ability is active
execute if score @s ms.si_timer matches 100 run scoreboard players set @s ms.si_timer 0
