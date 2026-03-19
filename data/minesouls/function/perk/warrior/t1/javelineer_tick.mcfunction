# Javelineer – Warrior Tier 1 Perk 3 (tick processing)
# Increases direct damage on thrown tridents, snowballs, and eggs by 2hp.
# Uses entity tags and per-tick tracking with execute on origin.

# --- Phase 1: Mark previously tagged projectiles as ready (existed ≥ 1 tick) ---
tag @e[tag=ms_jav_proj,tag=!ms_jav_ready] add ms_jav_ready

# --- Phase 2: Tag new projectiles owned by Javelineer warriors ---
# Note: "on origin" changes @s to the thrower, so we position at the projectile
# first (at @s) and then tag the projectile entity at that location.
execute as @e[type=trident,tag=!ms_jav_proj,tag=!ms_jav_dealt] at @s on origin if entity @s[scores={ms.class=1,ms.t1_perk=3}] run tag @e[type=trident,tag=!ms_jav_proj,distance=..0.01,limit=1] add ms_jav_proj
execute as @e[type=snowball,tag=!ms_jav_proj] at @s on origin if entity @s[scores={ms.class=1,ms.t1_perk=3}] run tag @e[type=snowball,tag=!ms_jav_proj,distance=..0.01,limit=1] add ms_jav_proj
execute as @e[type=egg,tag=!ms_jav_proj] at @s on origin if entity @s[scores={ms.class=1,ms.t1_perk=3}] run tag @e[type=egg,tag=!ms_jav_proj,distance=..0.01,limit=1] add ms_jav_proj

# --- Phase 3: Check tridents that dealt damage ---
execute as @e[type=trident,tag=ms_jav_proj,nbt={DealtDamage:1b}] at @s run function minesouls:perk/warrior/t1/javelineer_trident_hit

# --- Phase 4: Check snowball/egg proximity to entities ---
execute as @e[type=snowball,tag=ms_jav_proj,tag=ms_jav_ready] at @s run function minesouls:perk/warrior/t1/javelineer_proj_check
execute as @e[type=egg,tag=ms_jav_proj,tag=ms_jav_ready] at @s run function minesouls:perk/warrior/t1/javelineer_proj_check

# --- Phase 5: Clean up hit projectiles ---
tag @e[tag=ms_jav_hit] remove ms_jav_proj
tag @e[tag=ms_jav_hit] remove ms_jav_ready
tag @e[tag=ms_jav_hit] remove ms_jav_hit

# --- Phase 6: Reset dealt flag on returned/retrieved tridents ---
execute as @e[type=trident,tag=ms_jav_dealt,nbt={DealtDamage:0b}] run tag @s remove ms_jav_dealt
