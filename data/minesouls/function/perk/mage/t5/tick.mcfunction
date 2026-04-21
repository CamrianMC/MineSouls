# Mage Tier 5 perk tick – runs once per tick for every Mage with a T5 perk.
# Handles additional mana regeneration, mana display, spell casting, and acheron wither tracking.

# Make sure Acheron wither doesn't target friendly mobs
team join friendly @e[type=!#minesouls:hostile]

# Additional mana regen: +1 per tick on top of T1/T2/T3/T4's +1 each (total = 100 per second), capped at max
execute if score @s ms.mana < @s ms.mana_max run scoreboard players add @s ms.mana 1

# Mana display on actionbar (overwrites T4 display with updated value after T5 regen)
title @s actionbar [{"text":"✦ Mana: ","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana"},"color":"light_purple"},{"text":"/","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana_max"},"color":"light_purple"},{"text":" ✦","color":"dark_purple"}]

# Spell casting: detect right-click of warped_fungus_on_a_stick
# (ms.use_spell is globally reset for all players at the end of tick.mcfunction)
execute if score @s ms.use_spell matches 1.. run function minesouls:perk/mage/t5/cast

# Acheron tracking (only for Perk 2 mages)
# Decrement timer
execute if score @s ms.t5_perk matches 2 if score @s ms.acheron_timer matches 1.. run scoreboard players remove @s ms.acheron_timer 1

# Acheron expire: kill wither when timer reaches 0
execute if score @s ms.t5_perk matches 2 if score @s ms.acheron_active matches 1 if score @s ms.acheron_timer matches 0 run function minesouls:perk/mage/t5/acheron_expire

# Acheron killed early: reset if no acheron wither exists
execute if score @s ms.t5_perk matches 2 if score @s ms.acheron_active matches 1 if score @s ms.acheron_timer matches 1.. unless entity @e[type=minecraft:wither,tag=ms_acheron] run scoreboard players set @s ms.acheron_active 0
execute if score @s ms.t5_perk matches 2 if score @s ms.acheron_active matches 1 if score @s ms.acheron_timer matches 1.. unless entity @e[type=minecraft:wither,tag=ms_acheron] run scoreboard players set @s ms.acheron_timer 0
