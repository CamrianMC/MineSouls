# Into Thin Air – Cleanup blinded mobs that are no longer near an active ITA rogue
# Runs globally each tick on every mob tagged ms_ita_blinded.
# If no active ITA rogue is within 50 blocks, remove from the ms_into_thin_air team.

execute unless entity @a[tag=ms_ita_active,distance=..50] run team leave @s
execute unless entity @a[tag=ms_ita_active,distance=..50] run tag @s remove ms_ita_blinded
