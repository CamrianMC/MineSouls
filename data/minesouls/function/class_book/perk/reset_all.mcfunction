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
execute if entity @s[tag=ms_adrenaline_active] run attribute @s minecraft:attack_damage modifier remove minesouls:adrenaline_rush
execute if entity @s[tag=ms_barbaric_active] run attribute @s minecraft:attack_damage modifier remove minesouls:barbaric_training
execute if entity @s[tag=ms_calloused_active] run attribute @s minecraft:armor modifier remove minesouls:calloused_veteran

# Clear Warrior T5 perk state (Tough as Nails death_protection cleanup)
execute at @s run function minesouls:perk/warrior/t5/tan_unprotect
clear @s minecraft:knowledge_book[minecraft:custom_data~{ms_tan:1b}]
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

# Clear Rogue T4 perk state (remove attribute modifiers)
execute if entity @s[tag=ms_backstab_active] run attribute @s minecraft:attack_damage modifier remove minesouls:backstab
execute if entity @s[tag=ms_nightfall_active] run attribute @s minecraft:attack_damage modifier remove minesouls:nightfall

# Clear Rogue T5 perk state
scoreboard players set @s ms.cd_cd 0
scoreboard players set @s ms.ita_disable 0
attribute @s minecraft:fall_damage_multiplier base set 1

# Restore follow_range on any mobs blinded by Into Thin Air
execute at @s as @e[type=#minesouls:hostile,tag=ms_ita_blinded,distance=..10] run attribute @s minecraft:follow_range modifier remove minesouls:into_thin_air
execute at @s as @e[type=#minesouls:hostile,tag=ms_ita_blinded,distance=..10] run tag @s remove ms_ita_blinded

# Remove perk-related tags
tag @s remove ms_parry_blocking
tag @s remove ms_adrenaline_active
tag @s remove ms_barbaric_active
tag @s remove ms_calloused_active
tag @s remove ms_pickpocket_active
tag @s remove ms_dodge_sneaking
tag @s remove ms_backstab_active
tag @s remove ms_nightfall_active
tag @s remove ms_not_behind
tag @s remove ms_ita_active
tag @s remove ms_tan_protected

# Clear any lingering perk effects
effect clear @s minecraft:speed
effect clear @s minecraft:resistance
effect clear @s minecraft:regeneration
effect clear @s minecraft:haste
effect clear @s minecraft:fire_resistance
effect clear @s minecraft:luck
effect clear @s minecraft:jump_boost
effect clear @s minecraft:night_vision
effect clear @s minecraft:invisibility

# Notify the player
tellraw @s {"text":"Your class and perks have been fully reset.","color":"gold"}

# Clear Mage perk state (mana, goyim, spellbooks)
scoreboard players set @s ms.mana 0
scoreboard players set @s ms.mana_max 0
scoreboard players set @s ms.goyim_active 0
scoreboard players set @s ms.goyim_timer 0
scoreboard players set @s ms.use_spell 0
execute at @s run kill @e[type=minecraft:villager,tag=ms_goyim]
kill @e[type=marker,tag=ms_sb_rider]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{}}]