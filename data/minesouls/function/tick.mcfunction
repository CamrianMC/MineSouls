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

# Rogue Tier 1 perks: Light Feet, Barrel Roll, Pickpocket (per-player tick)
execute as @a[scores={ms.class=2,ms.t1_perk=1..3}] at @s run function minesouls:perk/rogue/t1/tick

# Stun system: decrement stun timers on affected entities
execute as @e[tag=ms_stunned] run function minesouls:perk/warrior/t3/stun_tick

# Confirm to reset class and perk selections for all players
execute as @a[scores={ms.classperk_reset=1}] run function minesouls:class_book/perk/reset_confimation
execute as @a[scores={ms.class_wipe=1}] run function minesouls:class_book/perk/reset_all

