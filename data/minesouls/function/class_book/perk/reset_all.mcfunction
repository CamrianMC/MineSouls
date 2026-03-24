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

# Clear Warrior T4 perk state (remove attribute modifiers)
execute if entity @s[tag=ms_adrenaline_active] run attribute @s minecraft:generic.attack_damage modifier remove minesouls:adrenaline_rush
execute if entity @s[tag=ms_barbaric_active] run attribute @s minecraft:generic.attack_damage modifier remove minesouls:barbaric_training
execute if entity @s[tag=ms_calloused_active] run attribute @s minecraft:generic.armor modifier remove minesouls:calloused_veteran

# Clear Warrior T5 perk state
scoreboard players set @s ms.tan_prev 0
scoreboard players set @s ms.tan_dmg 0
scoreboard players operation @s ms.iw_prev = @s ms.iw_blocked

# Clear Rogue T1 perk state
scoreboard players set @s ms.br_fall 0
scoreboard players set @s ms.br_prev 0

# Clear Rogue T2 perk state
scoreboard players set @s ms.ls_temp 0
scoreboard players set @s ms.dodge_cd 0
scoreboard players set @s ms.dodge_timer 0
scoreboard players set @s ms.sp_fall 0
scoreboard players set @s ms.sp_max 0

# Remove perk-related tags
tag @s remove ms_parry_blocking
tag @s remove ms_adrenaline_active
tag @s remove ms_barbaric_active
tag @s remove ms_calloused_active
tag @s remove ms_pickpocket_active
tag @s remove ms_dodge_sneaking

# Clear any lingering perk effects
effect clear @s minecraft:speed
effect clear @s minecraft:resistance
effect clear @s minecraft:regeneration
effect clear @s minecraft:haste
effect clear @s minecraft:fire_resistance
effect clear @s minecraft:luck
effect clear @s minecraft:jump_boost

# Notify the player
tellraw @s {"text":"Your class and perks have been fully reset.","color":"gold"}