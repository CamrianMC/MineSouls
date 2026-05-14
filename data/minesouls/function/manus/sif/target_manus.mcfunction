# target_manus – when no Darkwraiths remain, provoke Sif to retaliate at Manus.
# Resistance 5 (applied every tick) would absorb all damage, so it is cleared
# here first. Manus is the damage cause, which triggers wolf retaliation AI to
# lock onto him. Resistance 5 is re-applied on the very next tick by sif/tick.
# Runs as Sif (ms_sif wolf), at Sif's position; called only when no Darkwraiths.

execute as @e[tag=ms_manus,limit=1] run damage @e[tag=ms_sif,limit=1] 1 minecraft:mob_attack by @s