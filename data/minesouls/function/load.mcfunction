# This function runs once when the datapack is loaded
# Add your initialization commands here

tellraw @a {"text":"MineSouls plugin loaded!","color":"green"}

# Base game rules
gamerule minecraft:natural_health_regeneration false

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

# Warrior Tier 4 perk scoreboards (Calloused Veteran)
scoreboard objectives add ms.armor_rating armor

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
data merge storage minesouls:cd_offhand_backup {}

# Ranger Tier 1 perk scoreboards (Focused position tracking)
scoreboard objectives add ms.focus_temp dummy
scoreboard objectives add ms.focus_x dummy
scoreboard objectives add ms.focus_y dummy
scoreboard objectives add ms.focus_z dummy
scoreboard objectives add ms.focus_timer dummy

# Ranger Tier 3 perk scoreboards (arrow direction math)
scoreboard objectives add ms.arrow_temp dummy

# Ranger Tier 4 perk scoreboards (Survival Instincts position tracking + distance calc)
scoreboard objectives add ms.si_timer dummy
scoreboard objectives add ms.si_temp dummy
scoreboard objectives add ms.si_x dummy
scoreboard objectives add ms.si_y dummy
scoreboard objectives add ms.si_z dummy
scoreboard objectives add ms.si_dist dummy

# Ranger Tier 4 perk scoreboards (Disengage fall tracking + cooldown)
scoreboard objectives add ms.dis_fall dummy
scoreboard objectives add ms.dis_prev dummy
scoreboard objectives add ms.dis_cd dummy

# Ranger Tier 5 perk scoreboards (Sniper Elite raycast steps)
scoreboard objectives add ms.se_steps dummy

# Ranger Tier 5 perk storage (Sniper Elite – preserves bow/crossbow item data for enchantments)
data merge storage minesouls:se_bow {}

# Ranger Tier 5 perk scoreboards (Doom close-range raycast steps)
scoreboard objectives add ms.doom_steps dummy

# Ranger Tier 5 perk scoreboards (Doom bow fire cooldown)
scoreboard objectives add ms.doom_cd dummy

# Ranger Tier 5 perk storage (Doom instant bow fire – preserves bow item data)
data merge storage minesouls:doom_bow {}

# Ranger Tier 5 perk scoreboards (Beast Mastery wolf count + heal temp)
scoreboard objectives add ms.bm_count dummy
scoreboard objectives add ms.bm_temp dummy
scoreboard objectives add ms.bm_pdmg minecraft.custom:minecraft.damage_dealt
scoreboard objectives add ms.bm_pprev dummy
scoreboard objectives add ms.bm_mcd dummy

# Mage perk scoreboards
scoreboard objectives add ms.lifetime dummy
scoreboard objectives add ms.mana dummy
scoreboard objectives add ms.mana_max dummy
scoreboard objectives add ms.use_spell minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add ms.goyim_timer dummy
scoreboard objectives add ms.goyim_active dummy
scoreboard objectives add ms.spell_temp dummy

# Mage Tier 2 perk scoreboards
scoreboard objectives add ms.frosty_timer dummy
scoreboard objectives add ms.frosty_active dummy
scoreboard objectives add ms.frosty_fire dummy

# Mage Tier 3 perk scoreboards (Druid wolf tracking)
scoreboard objectives add ms.druid_timer dummy
scoreboard objectives add ms.druid_active dummy

# Mage Tier 4 perk scoreboards (Zeus raycast + Bodyguard golem tracking)
scoreboard objectives add ms.zeus_steps dummy
scoreboard objectives add ms.bodyguard_timer dummy
scoreboard objectives add ms.bodyguard_active dummy

# Mage Tier 5 perk scoreboards (Acheron wither tracking)
scoreboard objectives add ms.acheron_timer dummy
scoreboard objectives add ms.acheron_active dummy
scoreboard objectives add ms.acheron_fire dummy

# Darkwraith mob scoreboards
scoreboard objectives add ms.dw_hp dummy
team add friendly
team add manus
team modify manus friendlyFire false

# Sif companion: players + Sif share this team so Sif never targets players
team add ms_sif_alliance
team modify ms_sif_alliance friendlyFire false

# Into Thin Air: team used to suppress mob targeting while the perk is active
team add ms_into_thin_air
team modify ms_into_thin_air seeFriendlyInvisibles false

# Constants for scoreboard math (used by class book perk selection)
scoreboard objectives add ms.const dummy
scoreboard players set #-1 ms.const -1
scoreboard players set #1 ms.const 1
scoreboard players set #10 ms.const 10
scoreboard players set #100 ms.const 100

# Reset all players' class and perk selections
scoreboard objectives add ms.classperk_reset trigger
scoreboard objectives add ms.class_wipe trigger

# Show build info trigger
scoreboard objectives add ms.class_info trigger

# Shield detection
#scoreboard objectives add shieldBlock minecraft.custom:minecraft.damage_blocked_by_shield
#scoreboard objectives add shieldState dummy

# Optional: reset on load (not strictly needed)
#scoreboard players reset @a shieldState

# Prevent parry (Warrior T3) spam
scoreboard objectives add ms.parry_cd dummy

# Darkwraith mob scoreboards
scoreboard objectives add ms.dw_temp dummy

# Abyss init scoreboard
scoreboard objectives add ms.abyss_init dummy

# Manus boss scoreboards
scoreboard objectives add ms.manus_phase dummy
scoreboard objectives add ms.manus_skull_timer dummy
scoreboard objectives add ms.manus_skull_pattern dummy
scoreboard objectives add ms.manus_lightning_timer dummy
scoreboard objectives add ms.manus_wave_timer dummy
scoreboard objectives add ms.manus_move_timer dummy
scoreboard objectives add ms.manus_lw_timer dummy
scoreboard objectives add ms.manus_dw_timer dummy
scoreboard objectives add ms.manus_temp dummy
scoreboard objectives add ms.manus_dark_timer dummy

# Sin counter: tracks player sin for use by items like the Eucharist
scoreboard objectives add ms.sin dummy

# Achievement scoreboards
# Tracks villager trades per player (for "Kissing the wall" achievement)
scoreboard objectives add ms.trade_count dummy
# Global lock for first-recipient rewards (fake player entries)
scoreboard objectives add ms.first_reward dummy
# Set to 1 when Manus is spawned; reset when he dies or the check fires
scoreboard objectives add ms.manus_alive dummy
# Flag set when Darksign is first used at low HP (< 5); cleared on resolve or death
scoreboard objectives add ms.darksign_low_hp dummy

# Crest of Artorias summon countdown scoreboard
scoreboard objectives add ms.arta_summon_timer dummy

# Knight Artorias boss: initialise team, bossbar, and all scoreboard objectives
function minesouls:artorias/main/load
