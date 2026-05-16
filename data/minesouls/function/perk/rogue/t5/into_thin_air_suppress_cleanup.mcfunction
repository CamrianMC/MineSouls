# Into Thin Air – Restore follow_range on mobs that left the 12-block suppression zone
# Runs globally each tick on every mob tagged ms_ita_suppressed.
# If no active ITA rogue is within 12 blocks, restore follow_range to its default and remove the tag.

execute unless entity @a[tag=ms_ita_active,distance=..12] run attribute @s minecraft:follow_range base reset
execute unless entity @a[tag=ms_ita_active,distance=..12] run tag @s remove ms_ita_suppressed
