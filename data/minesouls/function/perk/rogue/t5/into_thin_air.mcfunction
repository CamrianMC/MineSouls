# Into Thin Air – Rogue Tier 5 Perk 3
# Completely untraceable while crouching.
# Ranged and melee attacks disable this for 10 seconds.
# Grants invisibility and adds the Rogue + nearby hostile mobs to the ms_into_thin_air team.

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

# Sneaking and not disabled: grant invisibility and join team
effect give @s minecraft:invisibility 2 0 true
tag @s add ms_ita_active
team join ms_into_thin_air @s

# Add hostile mobs within 50 blocks that have not yet been tagged
execute as @e[type=#minesouls:hostile,distance=..50,tag=!ms_ita_blinded] run team join ms_into_thin_air @s
execute as @e[type=#minesouls:hostile,distance=..50,tag=!ms_ita_blinded] run tag @s add ms_ita_blinded

# Reduce follow_range to 0 for hostile mobs within 12 blocks so they cannot track the rogue
execute as @e[type=#minesouls:hostile,distance=..12,tag=!ms_ita_suppressed] run attribute @s minecraft:follow_range base set 0
execute as @e[type=#minesouls:hostile,distance=..12,tag=!ms_ita_suppressed] run tag @s add ms_ita_suppressed

# Suppress Warden anger each tick while perk is active
execute as @e[type=minecraft:warden,distance=..50] run data modify entity @s anger set value []
