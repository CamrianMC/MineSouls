# This function runs every tick (20 times per second)
# Add your repeating commands here

# Estus Flask: enforce 1-flask limit (remove extras from players who obtained
# a second flask via creative mode or other means)
execute as @a run function minesouls:estus_flask/check_limit

# Estus Flask: keep each player's use-count scoreboard in sync with the item
# they are holding so the count is available inside the on_use reward function
# (which fires after the item is already consumed).
execute as @a run function minesouls:estus_flask/track_uses

# Bonfire rest: decrement the per-player cooldown each tick until it reaches 0
execute as @a[scores={ms.bonfire_rest=1..}] run scoreboard players remove @s ms.bonfire_rest 1

# Floydster: per-player suffocation death detection (must run before on_respawn syncs prev_deaths)
execute as @a run function minesouls:achievement/floydster_check

# Bonfire respawn: teleport each player to their bonfire after they die and respawn
execute as @a run function minesouls:bonfire/on_respawn

# Darksign: tick the per-player countdown for anyone currently using the Darksign
execute as @a[scores={ms.darksign_timer=1..}] run function minesouls:darksign/tick

# Flask of Wondrous Physik: enforce 1-flask limit per player
execute as @a run function minesouls:flask_of_wondrous_physik/check_limit

# Flask of Wondrous Physik: tick the per-player cycle cooldown
execute as @a[scores={ms.physik_cycle_timer=1..}] run scoreboard players remove @s ms.physik_cycle_timer 1

# Class book: enable triggers, process selections, remove book when off bedrock
execute as @a run function minesouls:class_book/tick

# Warrior Tier 1 perks: Charge, Turtle Shell (per-player tick)
execute as @a[scores={ms.class=1,ms.t1_perk=1..2}] at @s run function minesouls:perk/warrior/t1/tick

# Warrior Tier 1 perk: Javelineer projectile tracking (global tick)
function minesouls:perk/warrior/t1/javelineer_tick

# Warrior Tier 2 perks: Second Wind, Aura Farming (per-player tick)
execute as @a[scores={ms.class=1,ms.t2_perk=2..3}] at @s run function minesouls:perk/warrior/t2/tick

# Warrior Tier 3 perks: Thunder Clap, Concussion cooldown, Parry (per-player tick)
execute as @a[scores={ms.class=1,ms.t3_perk=1..3}] at @s run function minesouls:perk/warrior/t3/tick

# Warrior Tier 4 perks: Adrenaline Rush, Barbaric Training, Calloused Veteran (per-player tick)
execute as @a[scores={ms.class=1,ms.t4_perk=1..3}] at @s run function minesouls:perk/warrior/t4/tick

# Warrior Tier 5 perks: Avernus, Tough as Nails, Impenetrable Wall (per-player tick)
execute as @a[scores={ms.class=1,ms.t5_perk=1..3}] at @s run function minesouls:perk/warrior/t5/tick

# Ranger Tier 1 perks: Focused, Eagle's Nest (per-player tick)
execute as @a[scores={ms.class=3,ms.t1_perk=1..3}] at @s run function minesouls:perk/ranger/t1/tick

# Ranger Tier 2 perk: Explosive Shot – tag arrows by ownership (global tick)
function minesouls:perk/ranger/t2/explosive_shot_tick

# Explosive Shot: trigger explosion when a tagged arrow lands in a block
execute as @e[tag=ms_es_arrow,nbt={inGround:1b}] at @s run function minesouls:perk/ranger/t2/explosive_shot_block_hit

# Ranger Tier 3 perk: Ricochet arrow tracking (global tick)
function minesouls:perk/ranger/t3/ricochet_tick

# Ranger Tier 4 perks: Survival Instincts, Disengage (per-player tick)
execute as @a[scores={ms.class=3,ms.t4_perk=1..3}] at @s run function minesouls:perk/ranger/t4/tick

# Survival Instincts: cleanup glowing on mobs that wandered out of range
execute as @e[tag=ms_si_glowing] at @s run function minesouls:perk/ranger/t4/survival_instincts_cleanup

# Ranger Tier 5 perks: Sniper Elite, Doom, Beast Mastery (per-player tick)
execute as @a[scores={ms.class=3,ms.t5_perk=1..3}] at @s run function minesouls:perk/ranger/t5/tick

# Ranger Tier 5 perk: Sniper Elite hitscan arrow processing (global tick)
function minesouls:perk/ranger/t5/sniper_elite_tick

# Ranger Tier 5 perk: Doom arrow spray processing (global tick)
function minesouls:perk/ranger/t5/doom_tick

# Beast Mastery: if owner dealt damage this tick, set melee cooldown to 3 ticks
execute as @a[scores={ms.class=3,ms.t5_perk=3}] unless score @s ms.bm_pdmg = @s ms.bm_pprev run scoreboard players set @s ms.bm_mcd 3
execute as @a[scores={ms.class=3,ms.t5_perk=3}] run scoreboard players operation @s ms.bm_pprev = @s ms.bm_pdmg
# Beast Mastery: decrement melee cooldown
execute as @a[scores={ms.class=3,ms.t5_perk=3,ms.bm_mcd=1..}] run scoreboard players remove @s ms.bm_mcd 1

# Beast Mastery: wolf damage detection and owner healing (global tick)
execute as @e[type=minecraft:wolf,tag=ms_bm_wolf] at @s run function minesouls:perk/ranger/t5/beast_mastery_wolf_tick

# Rogue Tier 1 perks: Light Feet, Barrel Roll, Pickpocket (per-player tick)
execute as @a[scores={ms.class=2,ms.t1_perk=1..3}] at @s run function minesouls:perk/rogue/t1/tick

# Rogue Tier 2 perks: Dodge, Serious Parkour (per-player tick)
execute as @a[scores={ms.class=2,ms.t2_perk=2..3}] at @s run function minesouls:perk/rogue/t2/tick

# Rogue Tier 4 perks: Backstab, Nightfall (per-player tick)
execute as @a[scores={ms.class=2,ms.t4_perk=2..3}] at @s run function minesouls:perk/rogue/t4/tick

# Rogue Tier 5 perks: Cheat Death, Shinobi, Into Thin Air (per-player tick)
execute as @a[scores={ms.class=2,ms.t5_perk=1..3}] at @s run function minesouls:perk/rogue/t5/tick

# Into Thin Air: cleanup blinded mobs that wandered out of range
execute as @e[tag=ms_ita_blinded] at @s run function minesouls:perk/rogue/t5/into_thin_air_cleanup

# Into Thin Air: restore follow_range on mobs that left the 12-block suppression zone
execute as @e[tag=ms_ita_suppressed] at @s run function minesouls:perk/rogue/t5/into_thin_air_suppress_cleanup

# Mark of Sacrifice: tick timers on marked entities (Rogue T4 Perk 1)
execute as @e[tag=ms_mark_sacrifice] run function minesouls:perk/rogue/t4/mark_tick

# Bleed system: tick bleed damage on bleeding entities (Rogue T3 Perk 3)
execute as @e[tag=ms_bleeding] run function minesouls:perk/rogue/t3/bleed_tick

# Mage Tier 1 perks: Snowball, Goyim, Band-aid (per-player tick)
execute as @a[scores={ms.class=4,ms.t1_perk=1..3}] at @s run function minesouls:perk/mage/t1/tick

# Mage Tier 1: snowball hit detection (global tick)
function minesouls:perk/mage/t1/snowball_tick

# Mage Tier 1: goyim villager mob attraction (per-entity tick)
execute as @e[type=minecraft:villager,tag=ms_goyim] at @s run function minesouls:perk/mage/t1/goyim_tick

# Mage Tier 2 perks: Fireball, Frosty, Light Barrier (per-player tick)
execute as @a[scores={ms.class=4,ms.t2_perk=1..3}] at @s run function minesouls:perk/mage/t2/tick

# Mage Tier 2: fireball hit detection (global tick)
function minesouls:perk/mage/t2/fireball_tick

# Mage Tier 2: frosty snow golem turret (per-entity tick)
execute as @e[type=minecraft:snow_golem,tag=ms_frosty] at @s run function minesouls:perk/mage/t2/frosty_tick

# Mage Tier 2: frosty snowball hit detection (global tick)
function minesouls:perk/mage/t2/frosty_sb_tick

# Mage Tier 3 perks: Hurricane, Druid, Abandon Ship! (per-player tick)
execute as @a[scores={ms.class=4,ms.t3_perk=1..3}] at @s run function minesouls:perk/mage/t3/tick

# Mage Tier 3: druid wolf entity tick (per-entity, runs even if owner is absent)
execute as @e[type=minecraft:wolf,tag=ms_druid_wolf] at @s run function minesouls:perk/mage/t3/druid_wolf_tick

# Mage Tier 4 perks: Zeus, Bodyguard, Blink (per-player tick)
execute as @a[scores={ms.class=4,ms.t4_perk=1..3}] at @s run function minesouls:perk/mage/t4/tick

# Mage Tier 4: bodyguard entity tick (per-entity, runs even if owner is absent)
execute as @e[type=minecraft:iron_golem,tag=ms_bodyguard] at @s run function minesouls:perk/mage/t4/bodyguard_entity_tick

# Mage Tier 5 perks: Armageddon, Acheron, Fountain of Youth (per-player tick)
execute as @a[scores={ms.class=4,ms.t5_perk=1..3}] at @s run function minesouls:perk/mage/t5/tick

# Mage Tier 5: acheron wither entity tick (per-entity, runs even if owner is absent)
execute as @e[type=minecraft:wither,tag=ms_acheron] at @s run function minesouls:perk/mage/t5/acheron_entity_tick

# Manus boss: lightning warning marker particle effects and strike detection (global tick)
function minesouls:manus/lightning_tick

# Manus boss: descending dark energy ball particle trail, movement, and shockwave (global tick)
function minesouls:manus/dark_ball_tick

# Manus boss: per-entity behaviour (attacks, phases, despawn)
execute as @e[tag=ms_manus,type=!minecraft:marker] at @s run function minesouls:manus/tick

# Manus boss: clean up the health bar if Manus was killed rather than despawned
execute unless entity @e[tag=ms_manus,type=!minecraft:marker] run bossbar remove minesouls:manus

# Manus boss: grant "Hero of Oolacile" to all players when Manus is killed (not despawned)
execute unless entity @e[tag=ms_manus,type=!minecraft:marker] if score #global ms.manus_alive matches 1 run function minesouls:achievement/hero_of_oolacile_grant

# Manus boss: Sif companion wolf – effects, sword position, targeting
execute as @e[type=minecraft:wolf,tag=ms_sif] at @s run function minesouls:manus/sif/tick

# Manus boss: kill orphaned sword stand and release alliance team if Sif is gone
execute unless entity @e[type=minecraft:wolf,tag=ms_sif] run kill @e[type=minecraft:armor_stand,tag=ms_sif_sword]
execute unless entity @e[type=minecraft:wolf,tag=ms_sif] run team leave @a[team=ms_sif_alliance]

# Crest of Artorias: countdown tick for players with an active summon timer
execute as @a[scores={ms.arta_summon_timer=1..}] at @s run function minesouls:artorias_summon/tick

# Knight Artorias boss: per-entity behaviour (attacks, phases)
execute as @e[type=vindicator,tag=ms_artorias] at @s run function minesouls:artorias/main/tick
# Knight Artorias boss: music check (per-player)
execute as @a run function minesouls:artorias/main/music_check
# Knight Artorias boss: shockwave ring markers decay and deal damage
execute as @e[type=marker,tag=ms_arta_shockwave] at @s run function minesouls:artorias/attack/slam/shockwave_tick
execute as @e[type=marker,tag=ms_arta_shockwave_outer] at @s run function minesouls:artorias/attack/slam/shockwave_tick
# Knight Artorias boss: combo rupture ground-blast countdown
execute as @e[type=marker,tag=ms_arta_rupture] at @s run function minesouls:artorias/attack/combo/rupture_tick
# Knight Artorias boss: kill orphaned armor stand and hide bossbar when boss is dead
execute unless entity @e[type=vindicator,tag=ms_artorias] run kill @e[type=armor_stand,tag=ms_artorias_stand]
execute unless entity @e[type=vindicator,tag=ms_artorias] run bossbar set minesouls:artorias visible false
# Knight Artorias boss: grant "Champion of the Abyss" when killed (not despawned)
execute unless entity @e[type=vindicator,tag=ms_artorias] if score #global ms.arta_alive matches 1 run function minesouls:achievement/grant_champion_of_abyss

# Reset spell use counter for all players (must come after mage tick)
scoreboard players set @a ms.use_spell 0

# Yamaka: apply Hero of the Village to any player wearing the Yamaka helmet
function minesouls:yamaka/tick

# Greatsword of Artorias: apply Night Vision to any player holding it in their main hand
function minesouls:artorias/greatsword_tick

# Check for players falling into the void to teleport them over to the abyss dimension instead of letting them die
execute as @a[predicate=minesouls:falling_in_void] run effect give @s minecraft:slow_falling 1 0 true
execute as @a[predicate=minesouls:falling_in_void] at @s run function minesouls:abyss/travel_to_abyss

# Abyss dimension: per-player atmospheric effects (ash + void-mote particles)
execute as @a[predicate=minesouls:in_abyss] at @s run function minesouls:abyss/tick

# Stun system: decrement stun timers on affected entities
execute as @e[tag=ms_stunned] run function minesouls:perk/warrior/t3/stun_tick

# Confirm to reset class and perk selections for all players
execute as @a[scores={ms.classperk_reset=1}] run function minesouls:class_book/perk/reset_confimation
execute as @a[scores={ms.class_wipe=1}] run function minesouls:class_book/perk/reset_all

