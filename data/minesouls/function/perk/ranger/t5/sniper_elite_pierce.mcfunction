# Sniper Elite – Piercing Shot handler for hitscan raycast.
# Called when the raycast hits an entity and the Ranger has T3 Perk 2 (Piercing Shot).
# Deals damage and applies perk effects to the hit entity, tags it as pierced,
# then the raycast continues through it to hit additional targets.

# Tag the nearest hittable entity and mark as pierced so it won't be hit again
tag @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:marker,type=!#minesouls:arrow,type=!minecraft:area_effect_cloud,type=!minecraft:text_display,type=!minecraft:block_display,type=!minecraft:item_display,type=!minecraft:armor_stand,tag=!ms_se_pierced,distance=..2,sort=nearest,limit=1] add ms_se_target

# Bail if no target
execute unless entity @e[tag=ms_se_target,limit=1] run return 0

# Mark as pierced so the raycast skips this entity on subsequent steps
tag @e[tag=ms_se_target,limit=1] add ms_se_pierced

# ──────────────────────────────────────────────────────
# BASE DAMAGE  (fully charged arrow equivalent)
# ──────────────────────────────────────────────────────
damage @e[tag=ms_se_target,limit=1] 9 minecraft:arrow by @s

# ──────────────────────────────────────────────────────
# ENCHANTMENT BONUSES  (read from stored weapon data)
# ──────────────────────────────────────────────────────
# Power: +25% × (level + 1) bonus per arrow
scoreboard players set #se_power ms.arrow_temp 0
execute store result score #se_power ms.arrow_temp run data get storage minesouls:se_bow Weapon.components."minecraft:enchantments".levels."minecraft:power"
execute if score #se_power ms.arrow_temp matches 1 run damage @e[tag=ms_se_target,limit=1] 3 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 2 run damage @e[tag=ms_se_target,limit=1] 4 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 3 run damage @e[tag=ms_se_target,limit=1] 6 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 4 run damage @e[tag=ms_se_target,limit=1] 7 minecraft:arrow by @s
execute if score #se_power ms.arrow_temp matches 5.. run damage @e[tag=ms_se_target,limit=1] 9 minecraft:arrow by @s

# Flame: set target on fire
scoreboard players set #se_flame ms.arrow_temp 0
execute store result score #se_flame ms.arrow_temp run data get storage minesouls:se_bow Weapon.components."minecraft:enchantments".levels."minecraft:flame"
execute if score #se_flame ms.arrow_temp matches 1.. run data merge entity @e[tag=ms_se_target,limit=1] {Fire:100s}

# ──────────────────────────────────────────────────────
# PERK SYNERGIES  (per-entity effects only)
# ──────────────────────────────────────────────────────

# --- T1 Perk 1: Focused – +2 bonus damage if stationary for 3s ---
execute if score @s ms.t1_perk matches 1 if entity @s[tag=ms_focused] run damage @e[tag=ms_se_target,limit=1] 2 minecraft:generic by @s
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

# --- T2 Perk 3: Venomous Arrows – Slowness I for 5 seconds ---
execute if score @s ms.t2_perk matches 3 run effect give @e[tag=ms_se_target,limit=1] minecraft:slowness 5 0
execute if score @s ms.t2_perk matches 3 run playsound minecraft:entity.arrow.hit player @s ~ ~ ~ 1 1.5

# --- T3 Perk 3: Bleachscoped – Headshot bonus if ray is at head height ---
execute if score @s ms.t3_perk matches 3 run summon minecraft:marker ~ ~ ~ {Tags:["ms_se_hs_pos"]}
execute if score @s ms.t3_perk matches 3 store result score #hs_ay ms.arrow_temp run data get entity @e[tag=ms_se_hs_pos,limit=1] Pos[1] 100
execute if score @s ms.t3_perk matches 3 store result score #hs_ey ms.arrow_temp run data get entity @e[tag=ms_se_target,limit=1] Pos[1] 100
execute if score @s ms.t3_perk matches 3 run scoreboard players add #hs_ey ms.arrow_temp 150
execute if score @s ms.t3_perk matches 3 if score #hs_ay ms.arrow_temp >= #hs_ey ms.arrow_temp run damage @e[tag=ms_se_target,limit=1] 3 minecraft:arrow by @s
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
playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 0.8

# Cleanup (keep ms_se_pierced – removed by sniper_elite_fire after full raycast)
tag @e[tag=ms_se_target] remove ms_se_target

# Feedback for piercing through
playsound minecraft:entity.arrow.shoot player @s ~ ~ ~ 0.8 1.8
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0.2 10