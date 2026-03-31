# This function runs once when the datapack is loaded
# Add your initialization commands here

tellraw @a {"text":"MineSouls datapack loaded!","color":"green"}

# Estus Flask scoreboard: tracks the number of uses on the flask currently
# held by each player (used to preserve the count across the consumption tick)
scoreboard objectives add ms.estus_uses dummy

# Bonfire rest scoreboards
scoreboard objectives add ms.bonfire_rest dummy
scoreboard objectives add ms.bonfire_x dummy
scoreboard objectives add ms.bonfire_y dummy
scoreboard objectives add ms.bonfire_z dummy
scoreboard objectives add ms.bonfire_dim dummy
scoreboard objectives add ms.has_bonfire dummy

# Respawn-teleport scoreboards
scoreboard objectives add ms.deaths minecraft.custom:minecraft.deaths
scoreboard objectives add ms.prev_deaths dummy
scoreboard objectives add ms.pending_tp dummy
scoreboard objectives add ms.initialized dummy

# Darksign scoreboards
scoreboard objectives add ms.darksign_clicks dummy
scoreboard objectives add ms.darksign_timer dummy
scoreboard objectives add ms.spawn_x dummy
scoreboard objectives add ms.spawn_y dummy
scoreboard objectives add ms.spawn_z dummy

# Flask of Wondrous Physik scoreboards
scoreboard objectives add ms.physik_type dummy
scoreboard objectives add ms.physik_cycle_timer dummy
scoreboard objectives add ms.physik_count dummy

# Class book scoreboards
scoreboard objectives add ms.class dummy
scoreboard objectives add ms.class_tier dummy
scoreboard objectives add ms.t1_perk dummy
scoreboard objectives add ms.t2_perk dummy
scoreboard objectives add ms.t3_perk dummy
scoreboard objectives add ms.t4_perk dummy
scoreboard objectives add ms.t5_perk dummy
scoreboard objectives add ms.class_select trigger
scoreboard objectives add ms.perk_select trigger
scoreboard objectives add ms.cb_temp dummy
scoreboard objectives add ms.cb_class dummy
scoreboard objectives add ms.cb_tier dummy
scoreboard objectives add ms.cb_perk dummy

# Warrior Tier 2 perk scoreboards
scoreboard objectives add ms.second_wind dummy
scoreboard objectives add ms.health health

# Warrior Tier 3 perk scoreboards
scoreboard objectives add ms.tc_fall dummy
scoreboard objectives add ms.tc_max dummy
scoreboard objectives add ms.concussion_cd dummy
scoreboard objectives add ms.parry_timer dummy
scoreboard objectives add ms.parry_blocked minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add ms.parry_prev dummy
scoreboard objectives add ms.stun_timer dummy

# Warrior Tier 5 perk scoreboards
scoreboard objectives add ms.tan_prev dummy
scoreboard objectives add ms.tan_dmg dummy
scoreboard objectives add ms.tan_hit dummy
scoreboard objectives add ms.iw_blocked minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add ms.iw_prev dummy
data merge storage minesouls:offhand_backup {}

# Rogue Tier 1 perk scoreboards
scoreboard objectives add ms.br_fall dummy
scoreboard objectives add ms.br_prev dummy

# Rogue Tier 2 perk scoreboards
scoreboard objectives add ms.ls_temp dummy
scoreboard objectives add ms.dodge_cd dummy
scoreboard objectives add ms.dodge_timer dummy
scoreboard objectives add ms.sp_fall dummy
scoreboard objectives add ms.sp_max dummy

# Rogue Tier 3 perk scoreboards (Rip and Tear bleed system)
scoreboard objectives add ms.bleed_timer dummy
scoreboard objectives add ms.bleed_tick dummy

# Rogue Tier 4 perk scoreboards (Mark of Sacrifice)
scoreboard objectives add ms.mark_timer dummy

# Rogue Tier 5 perk scoreboards
scoreboard objectives add ms.cd_cd dummy
scoreboard objectives add ms.ita_disable dummy

# Ranger Tier 1 perk scoreboards (Focused position tracking)
scoreboard objectives add ms.focus_temp dummy
scoreboard objectives add ms.focus_x dummy
scoreboard objectives add ms.focus_y dummy
scoreboard objectives add ms.focus_z dummy
scoreboard objectives add ms.focus_timer dummy

# Ranger Tier 3 perk scoreboards (arrow direction math)
scoreboard objectives add ms.arrow_temp dummy

# Constants for scoreboard math (used by class book perk selection)
scoreboard objectives add ms.const dummy
scoreboard players set #1 ms.const 1
scoreboard players set #10 ms.const 10
scoreboard players set #100 ms.const 100

# Reset all players' class and perk selections
scoreboard objectives add ms.classperk_reset trigger
scoreboard objectives add ms.class_wipe trigger

# Shield detection
#scoreboard objectives add shieldBlock minecraft.custom:minecraft.damage_blocked_by_shield
#scoreboard objectives add shieldState dummy

# Optional: reset on load (not strictly needed)
#scoreboard players reset @a shieldState

# Prevent parry (Warrior T3) spam
scoreboard objectives add ms.parry_cd dummy


