# Sniper Elite – Hitscan hit handler.
# Runs at the raycast impact position, as the Ranger.
# Deals 9 base damage (equivalent to a fully charged bow) plus enchantment
# bonuses from the bow/crossbow and triggers other Ranger perk effects.

# Tag the nearest hittable entity
tag @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,distance=..3,sort=nearest,limit=1] add ms_se_target

# Bail if no target (shouldn't happen but safety check)
execute unless entity @e[tag=ms_se_target,limit=1] run return 0

# ──────────────────────────────────────────────────────
# BASE DAMAGE  (fully charged arrow equivalent)
# ──────────────────────────────────────────────────────
damage @e[tag=ms_se_target,limit=1] 27 minecraft:arrow by @s

# ──────────────────────────────────────────────────────
# ENCHANTMENT BONUSES  (read from stored weapon data)
# ──────────────────────────────────────────────────────
# Power: +25% × (level + 1) bonus per arrow
#   Lv1 +3, Lv2 +4, Lv3 +6, Lv4 +7, Lv5+ +9
scoreboard players set #se_power ms.arrow_temp 0
execute store result score #se_power ms.arrow_temp run data get storage minesouls:se_bow Weapon.components."minecraft:enchantments".levels."minecraft:power"
execute if score #se_power ms.arrow_temp matches 1 run damage @e[tag=ms_se_target,limit=1] 31 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 2 run damage @e[tag=ms_se_target,limit=1] 32 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 3 run damage @e[tag=ms_se_target,limit=1] 33 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 4 run damage @e[tag=ms_se_target,limit=1] 34 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 5.. run damage @e[tag=ms_se_target,limit=1] 36 minecraft:arrow by @s

# Flame: set target on fire (100 ticks = 5 seconds)
scoreboard players set #se_flame ms.arrow_temp 0
execute store result score #se_flame ms.arrow_temp run data get storage minesouls:se_bow Weapon.components."minecraft:enchantments".levels."minecraft:flame"
execute if score #se_flame ms.arrow_temp matches 1.. run data merge entity @e[tag=ms_se_target,limit=1] {Fire:100s}

# Punch: apply extra knockback to the target (1 bonus damage per level with knockback)
scoreboard players set #se_punch ms.arrow_temp 0
execute store result score #se_punch ms.arrow_temp run data get storage minesouls:se_bow Weapon.components."minecraft:enchantments".levels."minecraft:punch"
execute if score #se_punch ms.arrow_temp matches 1.. run damage @e[tag=ms_se_target,limit=1] 1 minecraft:arrow by @s
execute if score #se_punch ms.arrow_temp matches 2.. run damage @e[tag=ms_se_target,limit=1] 1 minecraft:arrow by @s

# ──────────────────────────────────────────────────────
# PERK SYNERGIES
# ──────────────────────────────────────────────────────

# --- T1 Perk 1: Focused – +2 bonus damage if stationary for 3s ---
execute if score @s ms.t1_perk matches 1 if entity @s[tag=ms_focused] run damage @e[tag=ms_se_target,limit=1] 29 minecraft:generic by @s
execute if score @s ms.t1_perk matches 1 if entity @s[tag=ms_focused] run scoreboard players set @s ms.focus_timer 0
execute if score @s ms.t1_perk matches 1 if entity @s[tag=ms_focused] run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1.5
execute if score @s ms.t1_perk matches 1 if entity @s[tag=ms_focused] at @e[tag=ms_se_target,limit=1] run particle minecraft:enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0.3 15
execute if score @s ms.t1_perk matches 1 if entity @s[tag=ms_focused] run tag @s remove ms_focused

# --- T1 Perk 2: Hit and Run – Speed I for 8 seconds ---
execute if score @s ms.t1_perk matches 2 run effect give @s minecraft:speed 8 0 true
execute if score @s ms.t1_perk matches 2 run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.5 2
execute if score @s ms.t1_perk matches 2 at @s run particle minecraft:happy_villager ~ ~ ~ 0.5 0.5 0.5 0.1 10

# --- T2 Perk 1: Barbed Arrows – Apply bleed (1 dmg/s for 5s) ---
execute if score @s ms.t2_perk matches 1 as @e[tag=ms_se_target,limit=1] run tag @s add ms_bleeding
execute if score @s ms.t2_perk matches 1 as @e[tag=ms_se_target,limit=1] run scoreboard players set @s ms.bleed_timer 100
execute if score @s ms.t2_perk matches 1 as @e[tag=ms_se_target,limit=1] run scoreboard players set @s ms.bleed_tick 0
execute if score @s ms.t2_perk matches 1 run playsound minecraft:entity.arrow.hit player @s ~ ~ ~ 1 0.8
execute if score @s ms.t2_perk matches 1 at @e[tag=ms_se_target,limit=1] run particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.5 0.3 0.1 8

# --- T2 Perk 2: Explosive Shot – AoE explosion damage ---
execute if score @s ms.t2_perk matches 2 at @e[tag=ms_se_target,limit=1] run particle minecraft:explosion ~ ~0.5 ~ 1 1 1 0.1 5
execute if score @s ms.t2_perk matches 2 at @e[tag=ms_se_target,limit=1] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1.2
execute if score @s ms.t2_perk matches 2 at @e[tag=ms_se_target,limit=1] as @e[type=!minecraft:player,tag=!ms_se_target,distance=..10,limit=10] run damage @s 3 minecraft:explosion by @p

# --- T2 Perk 3: Venomous Arrows – Slowness II for 5 seconds ---
execute if score @s ms.t2_perk matches 3 run effect give @e[tag=ms_se_target,limit=1] minecraft:slowness 5 1
execute if score @s ms.t2_perk matches 3 run playsound minecraft:entity.arrow.hit player @s ~ ~ ~ 1 1.5

# --- T3 Perk 3: Bleachscoped – Headshot bonus if ray is at head height ---
# Summon a marker at the current ray position to get its Y coordinate
execute if score @s ms.t3_perk matches 3 run summon minecraft:marker ~ ~ ~ {Tags:["ms_se_hs_pos"]}
execute if score @s ms.t3_perk matches 3 store result score #hs_ay ms.arrow_temp run data get entity @e[tag=ms_se_hs_pos,limit=1] Pos[1] 100
execute if score @s ms.t3_perk matches 3 store result score #hs_ey ms.arrow_temp run data get entity @e[tag=ms_se_target,limit=1] Pos[1] 100
# Head zone threshold: feet Y + 1.5 blocks (150 at scale ×100)
execute if score @s ms.t3_perk matches 3 run scoreboard players add #hs_ey ms.arrow_temp 150
execute if score @s ms.t3_perk matches 3 if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run damage @e[tag=ms_se_target,limit=1] 30 minecraft:arrow by @s
execute if score @s ms.t3_perk matches 3 if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 20 2
execute if score @s ms.t3_perk matches 3 if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp at @e[tag=ms_se_target,limit=1] run particle minecraft:crit ~ ~2 ~ 0.3 0.3 0.3 0.2 15
execute if score @s ms.t3_perk matches 3 if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run tellraw @s {"text":"☠ Headshot!","color":"red","bold":true}
execute if score @s ms.t3_perk matches 3 run kill @e[tag=ms_se_hs_pos]

# --- T4 Perk 2: Hawkeye – Replenish 1 arrow ---
execute if score @s ms.t4_perk matches 2 run give @s minecraft:arrow 1
execute if score @s ms.t4_perk matches 2 run playsound minecraft:entity.item.pickup player @s ~ ~ ~ 0.5 1.5

# ──────────────────────────────────────────────────────
# IMPACT EFFECTS
# ──────────────────────────────────────────────────────
execute at @e[tag=ms_se_target,limit=1] run particle minecraft:crit ~ ~1 ~ 0.3 0.5 0.3 0.2 20
playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1.5

# Cleanup
tag @e[tag=ms_se_target] remove ms_se_target
