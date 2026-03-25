# Into Thin Air – Cleanup blinded mobs that are no longer near an active ITA rogue
# Runs globally each tick on every mob tagged ms_ita_blinded.
# If no active ITA rogue is within 10 blocks, restore follow_range.

execute unless entity @a[tag=ms_ita_active,distance=..10] run attribute @s minecraft:generic.follow_range modifier remove minesouls:into_thin_air
execute unless entity @a[tag=ms_ita_active,distance=..10] run tag @s remove ms_ita_blinded
