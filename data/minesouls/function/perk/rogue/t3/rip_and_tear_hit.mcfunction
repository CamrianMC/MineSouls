# Rip and Tear – Rogue Tier 3 Perk 3
# Melee hits inflict bleed, dealing 1 damage per second for 5 seconds.

# Revoke advancement so it can trigger again on the next hit
advancement revoke @s only minesouls:perk/rogue/t3/rip_and_tear

# Verify a hostile target is within melee range
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Tag as bleeding and set/refresh bleed timer (100 ticks = 5 seconds)
tag @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1] add ms_bleeding
scoreboard players set @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1,tag=ms_bleeding] ms.bleed_timer 100
scoreboard players set @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1,tag=ms_bleeding] ms.bleed_tick 0

# Visual and audio feedback
playsound minecraft:entity.player.attack.sweep player @s ~ ~ ~ 1 0.8
particle minecraft:damage_indicator ~ ~1 ~ 0.3 0.5 0.3 0.1 8
