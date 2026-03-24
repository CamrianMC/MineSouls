# Into Thin Air – Rogue Tier 5 Perk 3
# Completely untraceable while crouching.
# Ranged and melee attacks disable this for 10 seconds.

# Decrement disable timer
execute if score @s ms.ita_disable matches 1.. run scoreboard players remove @s ms.ita_disable 1

# If not sneaking: remove invisibility and exit
execute unless predicate minesouls:is_sneaking if entity @s[tag=ms_ita_active] run effect clear @s minecraft:invisibility
execute unless predicate minesouls:is_sneaking run tag @s remove ms_ita_active
execute unless predicate minesouls:is_sneaking run return 0

# If disabled by attack: remove invisibility and exit
execute if score @s ms.ita_disable matches 1.. if entity @s[tag=ms_ita_active] run effect clear @s minecraft:invisibility
execute if score @s ms.ita_disable matches 1.. run tag @s remove ms_ita_active
execute if score @s ms.ita_disable matches 1.. run return 0

# Sneaking and not disabled: grant invisibility
effect give @s minecraft:invisibility 2 0 true
tag @s add ms_ita_active
