# Mage Tier 3 perk tick – runs once per tick for every Mage with a T3 perk.
# Handles additional mana regeneration, mana display, spell casting, and druid wolf tracking.

# Additional mana regen: +1 per tick on top of T1's +1 and T2's +1 (total = 60 per second), capped at max
execute if score @s ms.mana < @s ms.mana_max run scoreboard players add @s ms.mana 1

# Mana display on actionbar (overwrites T2 display with updated value after T3 regen)
title @s actionbar [{"text":"✦ Mana: ","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana"},"color":"light_purple"},{"text":"/","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana_max"},"color":"light_purple"},{"text":" ✦","color":"dark_purple"}]

# Spell casting: detect right-click of warped_fungus_on_a_stick
# (ms.use_spell is globally reset for all players at the end of tick.mcfunction)
execute if score @s ms.use_spell matches 1.. run function minesouls:perk/mage/t3/cast

# Druid tracking (only for Perk 2 mages)
# Decrement timer
execute if score @s ms.t3_perk matches 2 if score @s ms.druid_timer matches 1.. run scoreboard players remove @s ms.druid_timer 1

# Druid expire: kill wolves when timer reaches 0
execute if score @s ms.t3_perk matches 2 if score @s ms.druid_active matches 1 if score @s ms.druid_timer matches 0 run function minesouls:perk/mage/t3/druid_expire

# Druid killed early: reset if no druid wolves exist
execute if score @s ms.t3_perk matches 2 if score @s ms.druid_active matches 1 if score @s ms.druid_timer matches 1.. unless entity @e[type=minecraft:wolf,tag=ms_druid_wolf] run scoreboard players set @s ms.druid_active 0
execute if score @s ms.t3_perk matches 2 if score @s ms.druid_active matches 1 if score @s ms.druid_timer matches 1.. unless entity @e[type=minecraft:wolf,tag=ms_druid_wolf] run scoreboard players set @s ms.druid_timer 0
