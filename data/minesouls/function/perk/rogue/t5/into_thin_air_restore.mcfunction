# Into Thin Air – Restore follow_range on nearby mobs
# Called when the perk deactivates (stop sneaking or attack-disabled).
# Removes the follow_range modifier from all blinded mobs within 10 blocks.

execute as @e[type=#minesouls:hostile,tag=ms_ita_blinded,distance=..10] run attribute @s minecraft:follow_range modifier remove minesouls:into_thin_air
execute as @e[type=#minesouls:hostile,tag=ms_ita_blinded,distance=..10] run tag @s remove ms_ita_blinded
