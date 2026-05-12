# Crest of Artorias countdown tick.
# Runs once per tick for each player whose ms.arta_summon_timer is >= 1.
# "5" is shown immediately in on_use.mcfunction when the timer is set to 100.
# This function handles the remaining countdown (4 → 3 → 2 → 1) and the summon,
# checking each 20-tick (1-second) boundary after decrement.

# Decrement the countdown timer by one tick
scoreboard players remove @s ms.arta_summon_timer 1

# Display countdown numbers at each 1-second boundary
execute if score @s ms.arta_summon_timer matches 80 run title @a[distance=..20] times 2 18 2
execute if score @s ms.arta_summon_timer matches 80 run title @a[distance=..20] title {"text":"4","color":"dark_red","bold":true}
execute if score @s ms.arta_summon_timer matches 60 run title @a[distance=..20] times 2 18 2
execute if score @s ms.arta_summon_timer matches 60 run title @a[distance=..20] title {"text":"3","color":"dark_red","bold":true}
execute if score @s ms.arta_summon_timer matches 40 run title @a[distance=..20] times 2 18 2
execute if score @s ms.arta_summon_timer matches 40 run title @a[distance=..20] title {"text":"2","color":"dark_red","bold":true}
execute if score @s ms.arta_summon_timer matches 20 run title @a[distance=..20] times 2 18 2
execute if score @s ms.arta_summon_timer matches 20 run title @a[distance=..20] title {"text":"1","color":"dark_red","bold":true}

# When the timer reaches 0, summon Artorias
execute if score @s ms.arta_summon_timer matches 0 run function minesouls:artorias_summon/summon
