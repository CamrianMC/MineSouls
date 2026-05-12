# Explosive Shot – block impact
# Runs when a tagged explosive-shot arrow has embedded into a block.
# Triggers the same explosion effect and AoE damage as a mob hit, then kills the arrow.

# Visual explosion effect at impact location
particle minecraft:explosion ~ ~0.5 ~ 1 1 1 0.1 5
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1.2

# Deal AoE explosion damage to nearby non-player entities.
# @p selects the nearest player from the arrow's impact point (most likely the shooter).
# limit=10 matches the cap used by the mob-hit counterpart (explosive_shot_hit.mcfunction).
execute as @e[type=!minecraft:player,distance=..10,limit=10] run damage @s 3 minecraft:explosion by @p

# Remove tag and kill the embedded arrow
tag @s remove ms_es_arrow
kill @s
