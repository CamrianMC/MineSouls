# Bleed tick – runs as each bleeding entity.
# Deals 1 damage per second and removes bleed when timer expires.

# Decrement timer
scoreboard players remove @s ms.bleed_timer 1

# Increment damage interval counter
scoreboard players add @s ms.bleed_tick 1

# Apply 1 damage every 20 ticks (1 second)
execute if score @s ms.bleed_tick matches 20.. run damage @s 1 minecraft:generic
execute if score @s ms.bleed_tick matches 20.. run scoreboard players set @s ms.bleed_tick 0

# Visual feedback: blood particles while bleeding
particle minecraft:damage_indicator ~ ~0.5 ~ 0.3 0.5 0.3 0.01 1

# If timer expired, remove bleed
execute if score @s ms.bleed_timer matches ..0 run tag @s remove ms_bleeding
