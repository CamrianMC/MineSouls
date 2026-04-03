# Beast Mastery – Heal the Ranger 2 HP when their wolf deals damage.
# Runs as the Ranger (wolf's owner).

# Read current health (scaled x10), add 2 HP (20 at scale), cap at max 20 HP (200 at scale)
execute store result score @s ms.bm_temp run data get entity @s Health 10
scoreboard players add @s ms.bm_temp 20
execute if score @s ms.bm_temp matches 201.. run scoreboard players set @s ms.bm_temp 200
execute store result entity @s Health float 0.1 run scoreboard players get @s ms.bm_temp

# Subtle heal feedback
particle minecraft:heart ~ ~2 ~ 0.3 0.2 0.3 0 2
