# Tough as Nails – Warrior Tier 5 Perk 2 (tick)
# Manages death_protection on the offhand to prevent fatal damage from
# bypassing the 5-HP damage cap, and records health for a pre-damage baseline.

# Record current health as pre-damage baseline
execute store result score @s ms.tan_prev run data get entity @s Health 1

# Recover offhand item if death_protection consumed it from non-entity damage
# (e.g. fall, lava) where the advancement reward function does not fire
execute if entity @s[tag=ms_tan_protected] unless items entity @s weapon.offhand * run function minesouls:perk/warrior/t5/tan_restore_item

# Above 5hp: ensure death_protection is active on offhand
execute if score @s ms.tan_prev matches 6.. run function minesouls:perk/warrior/t5/tan_protect

# At or below 5hp: remove death_protection (cap cannot save you anyway)
execute if score @s ms.tan_prev matches ..5 run function minesouls:perk/warrior/t5/tan_unprotect
