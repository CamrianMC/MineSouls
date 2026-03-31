# Focused – Ranger Tier 1 Perk 1
# Standing stationary for >=3 seconds increases the damage of your next shot by 20%.
# Moving before the shot is fired will cancel the bonus.

# Detect movement: save old position to temp, read new position, compare
tag @s remove ms_focus_moved

scoreboard players operation @s ms.focus_temp = @s ms.focus_x
execute store result score @s ms.focus_x run data get entity @s Pos[0] 100
execute unless score @s ms.focus_temp = @s ms.focus_x run tag @s add ms_focus_moved

scoreboard players operation @s ms.focus_temp = @s ms.focus_y
execute store result score @s ms.focus_y run data get entity @s Pos[1] 100
execute unless score @s ms.focus_temp = @s ms.focus_y run tag @s add ms_focus_moved

scoreboard players operation @s ms.focus_temp = @s ms.focus_z
execute store result score @s ms.focus_z run data get entity @s Pos[2] 100
execute unless score @s ms.focus_temp = @s ms.focus_z run tag @s add ms_focus_moved

# If moved: reset timer and remove focused state
execute if entity @s[tag=ms_focus_moved] run scoreboard players set @s ms.focus_timer 0
execute if entity @s[tag=ms_focus_moved] run tag @s remove ms_focused

# Increment stationary timer
scoreboard players add @s ms.focus_timer 1

# At 60 ticks (3 seconds), activate focused state
execute if score @s ms.focus_timer matches 60 run tag @s add ms_focused
execute if score @s ms.focus_timer matches 60 run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5 2
execute if score @s ms.focus_timer matches 60 run particle minecraft:enchant ~ ~1 ~ 0.3 0.5 0.3 0.5 20

# Subtle particles while focused
execute if entity @s[tag=ms_focused] if score @s ms.focus_timer matches 61.. run particle minecraft:enchant ~ ~1 ~ 0.2 0.3 0.2 0.1 3
