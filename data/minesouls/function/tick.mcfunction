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

# Mage Tier 4 perks: Zeus, Bodyguard, Blink (per-player tick)
execute as @a[scores={ms.class=4,ms.t4_perk=1..3}] at @s run function minesouls:perk/mage/t4/tick

# Mage Tier 5 perks: Armageddon, Acheron, Fountain of Youth (per-player tick)
execute as @a[scores={ms.class=4,ms.t5_perk=1..3}] at @s run function minesouls:perk/mage/t5/tick

# Reset spell use counter for all players (must come after mage tick)
scoreboard players set @a ms.use_spell 0

# Stun system: decrement stun timers on affected entities
execute as @e[tag=ms_stunned] run function minesouls:perk/warrior/t3/stun_tick

# Confirm to reset class and perk selections for all players
execute as @a[scores={ms.classperk_reset=1}] run function minesouls:class_book/perk/reset_confimation
execute as @a[scores={ms.class_wipe=1}] run function minesouls:class_book/perk/reset_all

