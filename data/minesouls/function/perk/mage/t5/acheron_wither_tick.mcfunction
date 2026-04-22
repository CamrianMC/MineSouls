# Acheron Wither Tick – Per-player dispatch for the Acheron wither's custom behaviors.
# Runs as the mage player who owns the wither, at the player's position.
# Tags this player temporarily as the wither's anchor for leash and fire targeting.

# Tag self as anchor so the wither can navigate back toward us
tag @s add ms_acheron_anchor

# Run per-wither actions (fire timer + leash) as the nearest acheron wither
execute as @e[tag=ms_acheron,sort=nearest,limit=1] at @s run function minesouls:perk/mage/t5/acheron_wither_actions

# Remove anchor tag
tag @s remove ms_acheron_anchor
