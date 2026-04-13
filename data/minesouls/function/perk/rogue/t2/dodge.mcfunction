# Dodge – Rogue Tier 2 Perk 2
# Crouching gives a 10-tick invulnerability window. 5-second cooldown.

# Detect start of crouch: currently sneaking, was NOT sneaking last tick, not on cooldown
execute if predicate minesouls:is_sneaking unless entity @s[tag=ms_dodge_sneaking] unless score @s ms.dodge_cd matches 1.. run function minesouls:perk/rogue/t2/dodge_activate

# While dodge timer > 0: grant invulnerability (Resistance V = 100% damage reduction) and decrement
execute if score @s ms.dodge_timer matches 1.. run effect give @s minecraft:resistance 1 4 true
execute if score @s ms.dodge_timer matches 1.. run scoreboard players remove @s ms.dodge_timer 1

# When dodge window just ended: clear the resistance effect
execute if score @s ms.dodge_timer matches 0 if score @s ms.dodge_cd matches 91..100 run effect clear @s minecraft:resistance

# Decrement cooldown
execute if score @s ms.dodge_cd matches 1.. run scoreboard players remove @s ms.dodge_cd 1

# Track sneaking state for next tick
execute if predicate minesouls:is_sneaking run tag @s add ms_dodge_sneaking
execute unless predicate minesouls:is_sneaking run tag @s remove ms_dodge_sneaking
