# Mage Tier 1 perk tick – runs once per tick for every Mage with a T1 perk.
# Handles mana regeneration, mana display, spell casting, and goyim tracking.

# Mana regen: +1 per tick (= 20 per second), capped at max
execute if score @s ms.mana < @s ms.mana_max run scoreboard players add @s ms.mana 1

# Mana display on actionbar
title @s actionbar [{"text":"✦ Mana: ","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana"},"color":"light_purple"},{"text":"/","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana_max"},"color":"light_purple"},{"text":" ✦","color":"dark_purple"}]

# Spell casting: detect right-click of warped_fungus_on_a_stick
# (ms.use_spell is globally reset for all players at the end of tick.mcfunction)
execute if score @s ms.use_spell matches 1.. run function minesouls:perk/mage/t1/cast

# Goyim tracking (only for Perk 2 mages)
# Decrement timer
execute if score @s ms.t1_perk matches 2 if score @s ms.goyim_timer matches 1.. run scoreboard players remove @s ms.goyim_timer 1

# Goyim expire: kill when timer reaches 0
execute if score @s ms.t1_perk matches 2 if score @s ms.goyim_active matches 1 if score @s ms.goyim_timer matches 0 run function minesouls:perk/mage/t1/goyim_expire

# Goyim killed early: reset if no goyim entity exists
execute if score @s ms.t1_perk matches 2 if score @s ms.goyim_active matches 1 if score @s ms.goyim_timer matches 1.. unless entity @e[type=minecraft:villager,tag=ms_goyim] run scoreboard players set @s ms.goyim_active 0
execute if score @s ms.t1_perk matches 2 if score @s ms.goyim_active matches 1 if score @s ms.goyim_timer matches 1.. unless entity @e[type=minecraft:villager,tag=ms_goyim] run scoreboard players set @s ms.goyim_timer 0
