# Mark of Sacrifice – Rogue Tier 4 Perk 1
# Critical hits mark the target, increasing damage taken from all sources by +2 for 5 seconds.

# Revoke advancement so it can trigger again on the next critical hit
advancement revoke @s only minesouls:perk/rogue/t4/mark_of_sacrifice

# Verify a hostile target is within melee range
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Tag the nearest hostile in melee range and apply the mark
tag @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1] add ms_mark_target
execute as @e[tag=ms_mark_target,limit=1] run tag @s add ms_mark_sacrifice
execute as @e[tag=ms_mark_target,limit=1] run scoreboard players set @s ms.mark_timer 100
tag @e[tag=ms_mark_target] remove ms_mark_target

# Visual and audio feedback
playsound minecraft:entity.player.attack.crit player @s ~ ~ ~ 1 0.5
particle minecraft:enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0.1 15
