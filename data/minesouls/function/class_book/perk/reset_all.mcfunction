# Reset All – Wipe the player's class and perk progress back to square one.
# Called after the player confirms via reset_confimation.

# Clear class and tier
scoreboard players set @s ms.class 0
scoreboard players set @s ms.class_tier 0

# Clear all perk slots
scoreboard players set @s ms.t1_perk 0
scoreboard players set @s ms.t2_perk 0
scoreboard players set @s ms.t3_perk 0
scoreboard players set @s ms.t4_perk 0
scoreboard players set @s ms.t5_perk 0

# Clear class book temp scores
scoreboard players set @s ms.cb_temp 0
scoreboard players set @s ms.cb_class 0
scoreboard players set @s ms.cb_tier 0
scoreboard players set @s ms.cb_perk 0

# Clear trigger scores
scoreboard players set @s ms.class_select 0
scoreboard players set @s ms.perk_select 0
scoreboard players set @s ms.classperk_reset 0
scoreboard players set @s ms.class_wipe 0

# Clear Warrior T2 perk state
scoreboard players set @s ms.second_wind 0

# Clear Warrior T3 perk state
scoreboard players set @s ms.tc_fall 0
scoreboard players set @s ms.tc_max 0
scoreboard players set @s ms.concussion_cd 0
scoreboard players set @s ms.parry_timer 0
scoreboard players set @s ms.parry_prev 0

# Remove perk-related tags
tag @s remove ms_parry_blocking

# Clear any lingering perk effects
effect clear @s minecraft:speed
effect clear @s minecraft:resistance
effect clear @s minecraft:regeneration

# Notify the player
tellraw @s {"text":"Your class and perks have been fully reset.","color":"gold"}