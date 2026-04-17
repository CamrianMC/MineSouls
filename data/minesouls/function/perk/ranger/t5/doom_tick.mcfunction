# Doom – Ranger Tier 5 Perk 2 (global tick)
# Detects arrows fired by T5P2 Rangers and spawns a spray of extra arrows.

# --- Phase 1: Tag new arrows from Ranger T5P2 players ---
# Exclude already-processed spray arrows and other perk arrows
execute as @e[type=#minesouls:arrow,tag=!ms_doom_arrow,tag=!ms_doom_spray,tag=!ms_rico_fired,tag=!ms_se_arrow] at @s on origin if entity @s[scores={ms.class=3,ms.t5_perk=2}] run tag @e[type=#minesouls:arrow,tag=!ms_doom_arrow,tag=!ms_doom_spray,tag=!ms_rico_fired,tag=!ms_se_arrow,distance=..0.01,limit=1] add ms_doom_arrow

# --- Phase 1.5: Save weapon data from main arrow for spray enchantments + close-range checks ---
# For bow-fired arrows the weapon was set in doom_bow_fire; for crossbow-fired
# arrows the game sets it automatically.  Either way, copy it to storage so
# doom_fire and doom_close_hit can re-use it.
execute as @e[type=#minesouls:arrow,tag=ms_doom_arrow,limit=1] run data modify storage minesouls:doom_bow Weapon set from entity @s weapon

# --- Phase 2: Spawn spray from the origin player's position ---
execute as @e[type=#minesouls:arrow,tag=ms_doom_arrow] on origin at @s run function minesouls:perk/ranger/t5/doom_fire

# --- Phase 2.5: Close-range bonus damage ---
# MC Java ignores damage from simultaneous arrow hits, so if a mob is within
# 5 blocks of the shooter's line of sight, deal the damage the 4 spray arrows
# would have inflicted (4 × 6 = 24).
execute as @e[type=#minesouls:arrow,tag=ms_doom_arrow] on origin run tag @s add ms_doom_shooter
execute as @a[tag=ms_doom_shooter] at @s anchored eyes run function minesouls:perk/ranger/t5/doom_close_fire
tag @a[tag=ms_doom_shooter] remove ms_doom_shooter

# --- Phase 3: Mark processed arrows to prevent retrigger ---
tag @e[type=#minesouls:arrow,tag=ms_doom_arrow] add ms_doom_spray
tag @e[type=#minesouls:arrow,tag=ms_doom_arrow] remove ms_doom_arrow
