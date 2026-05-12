# target_manus – stores Manus's entity type and UUID into storage so the
# Brain.memories macro can redirect Sif's attack target at him.
# Runs as Sif, at Sif's position; called only when no Darkwraiths are nearby.

data modify storage minesouls:sif target_data.type set value "minecraft:warden"
execute as @e[tag=ms_manus,limit=1] run data modify storage minesouls:sif target_data.uuid set from entity @s UUID
function minesouls:manus/sif/set_target with storage minesouls:sif target_data
