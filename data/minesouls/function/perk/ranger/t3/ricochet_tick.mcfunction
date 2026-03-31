# Ricochet – Ranger Tier 3 Perk 1 (global tick)
# Tracks arrows from Ranger T3P1 players and checks for wall hits near hostiles.
# When a tagged arrow hits a wall near a hostile mob, spawns a new arrow aimed at the mob.

# --- Phase 1: Tag new arrows from Ranger T3P1 players ---
# "on origin" gets the player who shot the arrow; position stays at the arrow.
execute as @e[type=#minesouls:arrow,tag=!ms_rico_arrow,tag=!ms_rico_fired] at @s on origin if entity @s[scores={ms.class=3,ms.t3_perk=1}] run tag @e[type=#minesouls:arrow,tag=!ms_rico_arrow,tag=!ms_rico_fired,distance=..0.01,limit=1] add ms_rico_arrow

# --- Phase 2: Process grounded arrows – attempt ricochet if hostile mob nearby ---
execute as @e[type=#minesouls:arrow,tag=ms_rico_arrow,nbt={inGround:1b}] at @s run function minesouls:perk/ranger/t3/ricochet_fire

# --- Phase 3: Remove tracking tag from all grounded rico arrows (processed or not) ---
tag @e[type=#minesouls:arrow,tag=ms_rico_arrow,nbt={inGround:1b}] remove ms_rico_arrow
