# Mage Tier 4 perk tick – runs once per tick for every Mage with a T4 perk.
# Handles additional mana regeneration, mana display, spell casting, and bodyguard tracking.

# Additional mana regen: +1 per tick on top of T1/T2/T3's +1 each (total = 80 per second), capped at max
execute if score @s ms.mana < @s ms.mana_max run scoreboard players add @s ms.mana 1

# Mana display on actionbar (overwrites T3 display with updated value after T4 regen)
title @s actionbar [{"text":"✦ Mana: ","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana"},"color":"light_purple"},{"text":"/","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana_max"},"color":"light_purple"},{"text":" ✦","color":"dark_purple"}]

# Spell casting: detect right-click of warped_fungus_on_a_stick
# (ms.use_spell is globally reset for all players at the end of tick.mcfunction)
execute if score @s ms.use_spell matches 1.. run function minesouls:perk/mage/t4/cast

# Bodyguard tracking (only for Perk 2 mages)
# Decrement timer
execute if score @s ms.t4_perk matches 2 if score @s ms.bodyguard_timer matches 1.. run scoreboard players remove @s ms.bodyguard_timer 1

# Bodyguard expire: kill golems when timer reaches 0
execute if score @s ms.t4_perk matches 2 if score @s ms.bodyguard_active matches 1 if score @s ms.bodyguard_timer matches 0 run function minesouls:perk/mage/t4/bodyguard_expire

# Bodyguard killed early: reset if no bodyguard golems exist
execute if score @s ms.t4_perk matches 2 if score @s ms.bodyguard_active matches 1 if score @s ms.bodyguard_timer matches 1.. unless entity @e[type=minecraft:iron_golem,tag=ms_bodyguard] run scoreboard players set @s ms.bodyguard_active 0
execute if score @s ms.t4_perk matches 2 if score @s ms.bodyguard_active matches 1 if score @s ms.bodyguard_timer matches 1.. unless entity @e[type=minecraft:iron_golem,tag=ms_bodyguard] run scoreboard players set @s ms.bodyguard_timer 0
