# Beast Mastery – Wolf damage detection tick.
# Runs as each ms_bm_wolf, at the wolf's position.
# If a non-player, non-wolf entity within 3 blocks was just hurt (HurtTime:10s),
# the wolf likely dealt damage. Heal the wolf's owner (Ranger) 2 HP.

# Check for a recently-hurt entity near the wolf (melee attack range)
# Then switch context to the wolf's owner and heal them
execute if entity @e[type=!minecraft:player,type=!minecraft:wolf,nbt={HurtTime:10s},distance=..3,limit=1] on owner if entity @s[scores={ms.class=3,ms.t5_perk=3}] run function minesouls:perk/ranger/t5/beast_mastery_heal
