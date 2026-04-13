# Backstab – Rogue Tier 4 Perk 2
# Attacks from behind while crouching do 10x damage.
# Uses a tick-based attribute modifier: +900% melee damage (add_multiplied_base 9.0)
# when sneaking and positioned behind the nearest hostile in melee range.

# Clean up behind-check state from previous tick
tag @s remove ms_not_behind

# If not sneaking, remove modifier and stop
execute unless predicate minesouls:is_sneaking if entity @s[tag=ms_backstab_active] run attribute @s minecraft:attack_damage modifier remove minesouls:backstab
execute unless predicate minesouls:is_sneaking run tag @s remove ms_backstab_active
execute unless predicate minesouls:is_sneaking run return 0

# If no hostile in melee range, remove modifier and stop
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] if entity @s[tag=ms_backstab_active] run attribute @s minecraft:attack_damage modifier remove minesouls:backstab
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run tag @s remove ms_backstab_active
execute unless entity @e[type=#minesouls:hostile,distance=..4,limit=1] run return 0

# Tag self and nearest hostile for the behind-check
tag @s add ms_backstab_player
tag @e[type=#minesouls:hostile,distance=..4,sort=nearest,limit=1] add ms_backstab_check

# Check if the player is in front of the target:
# Place a point 3 blocks in front of the target's face.
# If the player is within 4 blocks of that point, they are in the target's front hemisphere.
execute as @e[tag=ms_backstab_check,limit=1] at @s positioned ^ ^ ^3 if entity @a[tag=ms_backstab_player,distance=..4] run tag @a[tag=ms_backstab_player] add ms_not_behind

# Clean up temp tags
tag @e[tag=ms_backstab_check] remove ms_backstab_check
tag @s remove ms_backstab_player

# If player is in front (not behind), remove modifier and stop
# (ms_not_behind is cleaned up at the start of the next tick)
execute if entity @s[tag=ms_not_behind] if entity @s[tag=ms_backstab_active] run attribute @s minecraft:attack_damage modifier remove minesouls:backstab
execute if entity @s[tag=ms_not_behind] run tag @s remove ms_backstab_active
execute if entity @s[tag=ms_not_behind] run return 0

# Player is behind the target: apply +900% melee damage modifier (10x total)
execute unless entity @s[tag=ms_backstab_active] run attribute @s minecraft:attack_damage modifier add minesouls:backstab 9.0 add_multiplied_base
tag @s add ms_backstab_active
