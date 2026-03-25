# Mark of Sacrifice tick – runs as each marked entity.
# Decrements the timer and removes the mark when expired.

# Decrement timer
scoreboard players remove @s ms.mark_timer 1

# Visual feedback: particles while marked
particle minecraft:enchant ~ ~1 ~ 0.3 0.5 0.3 0.1 3

# If timer expired, remove mark
execute if score @s ms.mark_timer matches ..0 run tag @s remove ms_mark_sacrifice
