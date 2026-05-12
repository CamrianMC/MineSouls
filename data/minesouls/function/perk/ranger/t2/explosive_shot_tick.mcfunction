# Explosive Shot – per-player tick (Ranger T2 Perk 2)
# Runs every tick for Ranger players with Explosive Shot selected.
# Tags any arrow in flight within 128 blocks so we can detect when it hits a block.
# Note: vanilla datapacks cannot compare arrow Owner UUIDs dynamically, so proximity-
# based tagging is used. Arrows from other nearby players may also be tagged, but this
# edge case is rare and acceptable in small-group play.
execute as @e[type=minecraft:arrow,distance=..128,tag=!ms_es_arrow,nbt={inGround:0b}] run tag @s add ms_es_arrow
