# Into Thin Air – Rogue Tier 5 Perk 3
# Completely untraceable while crouching.
# Ranged and melee attacks disable this for 10 seconds.
# Grants invisibility and sets follow_range to 0 on nearby hostile mobs.

# Decrement disable timer
execute if score @s ms.ita_disable matches 1.. run scoreboard players remove @s ms.ita_disable 1

# If not sneaking: deactivate and exit
execute unless predicate minesouls:is_sneaking if entity @s[tag=ms_ita_active] run effect clear @s minecraft:invisibility
execute unless predicate minesouls:is_sneaking if entity @s[tag=ms_ita_active] run function minesouls:perk/rogue/t5/into_thin_air_restore
execute unless predicate minesouls:is_sneaking run tag @s remove ms_ita_active
execute unless predicate minesouls:is_sneaking run return 0

# If disabled by attack: deactivate and exit
execute if score @s ms.ita_disable matches 1.. if entity @s[tag=ms_ita_active] run effect clear @s minecraft:invisibility
execute if score @s ms.ita_disable matches 1.. if entity @s[tag=ms_ita_active] run function minesouls:perk/rogue/t5/into_thin_air_restore
execute if score @s ms.ita_disable matches 1.. run tag @s remove ms_ita_active
execute if score @s ms.ita_disable matches 1.. run return 0

# Sneaking and not disabled: grant invisibility and blind nearby hostiles
effect give @s minecraft:invisibility 2 0 true
tag @s add ms_ita_active

# Set follow_range to 0 on all hostile mobs within 10 blocks (modifier add silently fails if already present)
execute as @e[type=#minesouls:hostile,distance=..10] run attribute @s minecraft:generic.follow_range modifier add minesouls:into_thin_air -1.0 add_multiplied_base
execute as @e[type=#minesouls:hostile,distance=..10] run tag @s add ms_ita_blinded
