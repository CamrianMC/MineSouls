# Tough as Nails – Warrior Tier 5 Perk 2 (tick)
# Keeps ms.tan_prev in sync with actual health so the advancement reward
# function (tough_as_nails_hit) always has an accurate pre-damage snapshot.

execute store result score @s ms.tan_prev run data get entity @s Health 1
