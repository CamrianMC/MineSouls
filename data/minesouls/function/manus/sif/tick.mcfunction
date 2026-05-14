# Sif tick – per-entity behaviour for the Great Grey Wolf Sif.
# Runs as Sif (ms_sif wolf), at Sif's position.
# Dispatched from the global tick as:
#   execute as @e[type=minecraft:wolf,tag=ms_sif] at @s run function minesouls:manus/sif/tick

# Permanent status effects (2-tick duration refreshed every tick)
# Regeneration 10: extremely fast healing so Sif stays at full health
# Resistance 5: near-total damage immunity so she survives Manus's attacks
# Glowing 0: makes Sif visible through walls so the player can track her
effect give @s minecraft:regeneration 2 255 true
effect give @s minecraft:glowing 2 0 true
attribute @s fall_damage_multiplier base set 0.0
attribute @s knockback_resistance base set 1
attribute @s armor base set 20

# Teleport the sword armor stand to Sif's mouth position each tick.
# Local coords: ^0 ^0.5 ^0.3 = 0.5 blocks up and 0.3 blocks forward from
# Sif's feet, placing the stand at approximately wolf-head/mouth height.
# ~ 0 inherits Sif's yaw and locks pitch to 0 so the sword stays flat.
# Fine-tune the ^up and ^forward offsets in-game as needed.
tp @e[tag=ms_sif_sword,sort=nearest,limit=1] ^0 ^0 ^1 ~ 0

# ── Leash ─────────────────────────────────────────────────────────────────────
# If Manus is alive and Sif has wandered more than 50 blocks away, snap her back
# to his position so she stays in the fight.
execute if entity @e[tag=ms_manus,distance=50..] run tp @s @e[tag=ms_manus,limit=1]

# ── Targeting ────────────────────────────────────────────────────────────────
# Wolves naturally attack skeletons (Darkwraiths) on sight – no override needed.
# When no Darkwraiths are on the field, have Manus deal 1 HP to Sif so wolf AI
# retaliates against him. Resistance is cleared inside target_manus and
# re-applied next tick by the effect gives above.
execute unless entity @e[tag=ms_darkwraith,limit=1,distance=..64] if entity @e[tag=ms_manus,limit=1] run function minesouls:manus/sif/target_manus

# ── Team maintenance ──────────────────────────────────────────────────────────
# Any player who joined the world after Sif was spawned won't be on the alliance
# team yet; add them now so Sif never turns on a latecomer.
team join ms_sif_alliance @a[team=!ms_sif_alliance]
