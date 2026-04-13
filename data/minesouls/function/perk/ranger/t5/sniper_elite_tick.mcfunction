# Sniper Elite – Ranger Tier 5 Perk 1 (global tick)
# Fired arrows become hitscan: detect new arrows from T5P1 Rangers, kill them,
# and raycast from the shooter's eyes to damage the first entity in line of sight.

# --- Phase 1: Tag new arrows from Ranger T5P1 players ---
execute as @e[type=#minesouls:arrow,tag=!ms_se_arrow,tag=!ms_rico_fired,tag=!ms_doom_spray] at @s on origin if entity @s[scores={ms.class=3,ms.t5_perk=1}] run tag @e[type=#minesouls:arrow,tag=!ms_se_arrow,tag=!ms_rico_fired,tag=!ms_doom_spray,distance=..0.01,limit=1] add ms_se_arrow

# --- Phase 2: Tag the shooting player ---
execute as @e[type=#minesouls:arrow,tag=ms_se_arrow] on origin run tag @s add ms_se_shooter

# --- Phase 3: Kill the intercepted arrows ---
kill @e[type=#minesouls:arrow,tag=ms_se_arrow]

# --- Phase 4: Raycast from each tagged shooter's eyes ---
execute as @a[tag=ms_se_shooter] at @s anchored eyes run function minesouls:perk/ranger/t5/sniper_elite_fire

# --- Phase 5: Cleanup ---
tag @a[tag=ms_se_shooter] remove ms_se_shooter
