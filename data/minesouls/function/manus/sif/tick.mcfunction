# Sif tick – per-entity behaviour for the Great Grey Wolf Sif.
# Runs as Sif (ms_sif wolf), at Sif's position.
# Dispatched from the global tick as:
#   execute as @e[type=minecraft:wolf,tag=ms_sif] at @s run function minesouls:manus/sif/tick

# Permanent status effects (2-tick duration refreshed every tick)
# Regeneration 10: extremely fast healing so Sif stays at full health
# Resistance 5: near-total damage immunity so she survives Manus's attacks
effect give @s minecraft:regeneration 2 10 true
effect give @s minecraft:resistance 2 5 true

# Teleport the sword armor stand to Sif's exact position each tick, matching
# her facing direction (yaw) with a flat pitch so the sword stays horizontal.
# execute at @s sets both position and rotation context to Sif, so ~ ~ ~ copies
# her XYZ and ~ copies her yaw; the absolute 0 pitch keeps the sword level.
tp @e[tag=ms_sif_sword,sort=nearest,limit=1] ~ ~ ~ ~ 0

# ── Targeting ────────────────────────────────────────────────────────────────
# Wolves naturally attack skeletons (Darkwraiths) on sight – no override needed.
# When no Darkwraiths are within 64 blocks, redirect Sif at Manus via
# Brain.memories so she doesn't just idle after clearing a wave.
execute unless entity @e[tag=ms_darkwraith,limit=1,distance=..64] if entity @e[tag=ms_manus,limit=1] run function minesouls:manus/sif/target_manus

# ── Team maintenance ──────────────────────────────────────────────────────────
# Any player who joined the world after Sif was spawned won't be on the alliance
# team yet; add them now so Sif never turns on a latecomer.
team join ms_sif_alliance @a[team=!ms_sif_alliance]
