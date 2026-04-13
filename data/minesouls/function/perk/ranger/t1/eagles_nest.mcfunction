# Eagle's Nest – Ranger Tier 1 Perk 3
# The player can slowly wallclimb. Slowly consumes hunger while wallclimbing.
# Detects adjacent walls when airborne and applies levitation + hunger.

# Clear detection tags
tag @s remove ms_wallclimb
tag @s remove ms_en_airborne

# Step 1: detect if player is airborne (block below feet is air)
execute if block ~ ~-0.1 ~ minecraft:air run tag @s add ms_en_airborne
execute if block ~ ~-0.1 ~ minecraft:cave_air run tag @s add ms_en_airborne

# Step 2: detect adjacent walls in 4 directions at feet level (only when airborne)
execute if entity @s[tag=ms_en_airborne] positioned ~0.4 ~ ~ unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run tag @s add ms_wallclimb
execute if entity @s[tag=ms_en_airborne] positioned ~-0.4 ~ ~ unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run tag @s add ms_wallclimb
execute if entity @s[tag=ms_en_airborne] positioned ~ ~ ~0.4 unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run tag @s add ms_wallclimb
execute if entity @s[tag=ms_en_airborne] positioned ~ ~ ~-0.4 unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run tag @s add ms_wallclimb

# Wallclimbing: apply levitation (slow upward movement) and hunger drain
execute if entity @s[tag=ms_wallclimb] run effect give @s minecraft:levitation 1 0 true
execute if entity @s[tag=ms_wallclimb] run effect give @s minecraft:hunger 1 1 true
execute if entity @s[tag=ms_wallclimb] run tag @s add ms_en_active

# Not wallclimbing: clear levitation if it was from us
execute unless entity @s[tag=ms_wallclimb] if entity @s[tag=ms_en_active] run effect clear @s minecraft:levitation
execute unless entity @s[tag=ms_wallclimb] run tag @s remove ms_en_active
