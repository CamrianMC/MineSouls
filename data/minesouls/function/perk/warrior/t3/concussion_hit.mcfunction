# Concussion – Warrior Tier 3 Perk 2
# Landing a critical hit stuns the enemy for 3 seconds. 10-second cooldown.

# Revoke advancement so it can trigger again on the next critical hit
advancement revoke @s only minesouls:perk/warrior/t3/concussion

# Check cooldown (10 seconds = 200 ticks); if on cooldown, do nothing
execute if score @s ms.concussion_cd matches 1.. run return 0

# Verify a hostile target is within melee range before applying cooldown
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Stun the nearest hostile mob within 4 blocks (melee range) for 3 seconds (60 ticks)
tag @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1] add ms_concussion_target
execute as @e[tag=ms_concussion_target,limit=1] run data merge entity @s {NoAI:1b}
execute as @e[tag=ms_concussion_target,limit=1] run scoreboard players set @s ms.stun_timer 60
execute as @e[tag=ms_concussion_target,limit=1] run tag @s add ms_stunned
tag @e[tag=ms_concussion_target] remove ms_concussion_target

# Start cooldown (200 ticks = 10 seconds)
scoreboard players set @s ms.concussion_cd 200

# Visual and audio feedback
playsound minecraft:entity.player.attack.crit player @s ~ ~ ~ 1 0.5
playsound minecraft:block.anvil.place player @s ~ ~ ~ 1 1
particle minecraft:crit ~ ~1 ~ 0.5 0.5 0.5 0.1 15
