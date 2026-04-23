# Goyim Tick – Per-entity tick for the goyim villager.
# Attracts all hostile mobs within 20 blocks by dealing 1 damage from the
# villager (causing aggro), then immediately healing it back.
# Runs as the goyim villager, at the goyim's position.

# Tag self for targeting reference
tag @s add ms_goyim_target

# Deal 1 damage to each hostile FROM the goyim (makes mobs aggro onto it),
# then instantly heal back the damage so mobs don't actually lose HP.
# Undead mobs are healed by instant_damage and hurt by instant_health, so
# we split the heal into two selectors.
execute as @e[type=#minesouls:hostile,distance=..20] at @s run damage @s 1 minecraft:generic by @e[tag=ms_goyim_target,limit=1]
execute as @e[type=#minesouls:hostile,type=!#minesouls:undead,distance=..20] run effect give @s minecraft:instant_health 1 0 true
execute as @e[type=#minesouls:undead,distance=..20] run effect give @s minecraft:instant_damage 1 0 true

# Cleanup target tag
tag @s remove ms_goyim_target
