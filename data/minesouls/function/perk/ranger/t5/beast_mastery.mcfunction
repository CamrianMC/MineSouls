# Beast Mastery – Ranger Tier 5 Perk 3 (per-player tick)
# Wolves tamed by the Ranger have permanent Strength II.
# Any damage dealt by the wolves heals 2 HP to the Ranger.
# The Ranger will always have at least 1 tamed wolf.

# --- Count owned wolves nearby ---
execute store result score @s ms.bm_count if entity @e[type=minecraft:wolf,tag=ms_bm_wolf,distance=..50]

# --- Summon a wolf if none exist ---
execute if score @s ms.bm_count matches 0 run function minesouls:perk/ranger/t5/beast_mastery_summon

# --- Buff all tagged wolves within range with Strength II ---
# Strength II (amplifier 1) for 2 seconds, refreshed every tick, hidden particles
execute as @e[type=minecraft:wolf,tag=ms_bm_wolf,distance=..50] at @s run effect give @s minecraft:strength 2 1 true
