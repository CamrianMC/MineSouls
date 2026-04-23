# Hurricane – Mage Tier 3 Perk 1
# Conjures a burst of wind that damages and knocks back all enemies in a cone
# in front of the player. Costs 300 mana.
# The cone is approximated by checking hostiles within 6 blocks that are
# roughly in front of the player (within ~60° of the look direction).

# Check mana
execute unless score @s ms.mana matches 300.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 300.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 300

# --- Cone detection via positional check ---
# Place a marker 4 blocks ahead of the player in the look direction (at eye level)
execute anchored eyes positioned ^ ^ ^4 run summon minecraft:marker ~ ~ ~ {Tags:["ms_hurr_center"]}

# Damage and knock back all hostiles within 6 blocks of the player
# that are ALSO within 5 blocks of the cone center marker (approximates a forward cone)
# player_attack damage type naturally applies knockback away from the attacker
execute as @e[type=#minesouls:hostile,distance=..6] at @s if entity @e[tag=ms_hurr_center,distance=..5] run damage @s 6 minecraft:player_attack by @a[scores={ms.class=4,ms.t3_perk=1},sort=nearest,limit=1]

# Cleanup cone marker
kill @e[tag=ms_hurr_center]

# Visual and audio feedback
playsound minecraft:entity.wind_charge.wind_burst player @a[distance=..32] ~ ~ ~ 1 1
particle minecraft:gust_emitter_large ~ ~1 ~ 0 0 0 0 1
execute anchored eyes positioned ^ ^ ^3 run particle minecraft:cloud ~ ~ ~ 1.5 0.5 1.5 0.1 30
execute anchored eyes positioned ^ ^ ^3 run particle minecraft:sweep_attack ~ ~ ~ 1.5 0.5 1.5 0.1 10

# Feedback
# tellraw @s [{"text":"Hurricane!","color":"green"}]
