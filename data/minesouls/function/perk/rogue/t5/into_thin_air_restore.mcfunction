# Into Thin Air – Restore when perk deactivates
# Called when the perk deactivates (stop sneaking or attack-disabled).
# Removes this player from the ms_into_thin_air team.
# Blinded mobs with no remaining active ITA rogue nearby are cleaned up by the global tick.

team leave @s
