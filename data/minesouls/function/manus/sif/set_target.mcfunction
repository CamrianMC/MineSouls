# set_target – macro function that writes Sif's Brain.memories attack_target.
# Call via: function minesouls:manus/sif/set_target with storage minesouls:sif target_data
# Expected storage fields:
#   target_data.type  – entity type string, e.g. "minecraft:warden"
#   target_data.uuid  – int-array UUID copied from entity @s UUID
# ttl:100 (5 seconds) is refreshed every tick while the condition holds.

$data modify entity @s Brain.memories."minecraft:attack_target" set value {value:{id:"$(type)",UUID:$(uuid)},ttl:100}
