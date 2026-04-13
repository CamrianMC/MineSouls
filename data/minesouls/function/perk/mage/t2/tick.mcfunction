# Mage Tier 2 perk tick – runs once per tick for every Mage with a T2 perk.
# Handles additional mana regeneration, mana display, spell casting, and frosty tracking.

# Additional mana regen: +1 per tick on top of T1's +1 (total = 40 per second), capped at max
execute if score @s ms.mana < @s ms.mana_max run scoreboard players add @s ms.mana 1

# Mana display on actionbar (overwrites T1 display with updated value after T2 regen)
title @s actionbar [{"text":"✦ Mana: ","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana"},"color":"light_purple"},{"text":"/","color":"dark_purple"},{"score":{"name":"@s","objective":"ms.mana_max"},"color":"light_purple"},{"text":" ✦","color":"dark_purple"}]

# Spell casting: detect right-click of warped_fungus_on_a_stick
# (ms.use_spell is globally reset for all players at the end of tick.mcfunction)
execute if score @s ms.use_spell matches 1.. run function minesouls:perk/mage/t2/cast

# Frosty tracking (only for Perk 2 mages)
# Decrement timer
execute if score @s ms.t2_perk matches 2 if score @s ms.frosty_timer matches 1.. run scoreboard players remove @s ms.frosty_timer 1

# Frosty expire: kill when timer reaches 0
execute if score @s ms.t2_perk matches 2 if score @s ms.frosty_active matches 1 if score @s ms.frosty_timer matches 0 run function minesouls:perk/mage/t2/frosty_expire

# Frosty killed early: reset if no frosty entity exists
execute if score @s ms.t2_perk matches 2 if score @s ms.frosty_active matches 1 if score @s ms.frosty_timer matches 1.. unless entity @e[type=minecraft:snow_golem,tag=ms_frosty] run scoreboard players set @s ms.frosty_active 0
execute if score @s ms.t2_perk matches 2 if score @s ms.frosty_active matches 1 if score @s ms.frosty_timer matches 1.. unless entity @e[type=minecraft:snow_golem,tag=ms_frosty] run scoreboard players set @s ms.frosty_timer 0
