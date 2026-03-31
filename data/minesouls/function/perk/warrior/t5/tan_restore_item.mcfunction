# Tough as Nails – Restore offhand item consumed by death_protection
# Called from tough_as_nails_hit when the offhand is empty but was protected.
# Restores the backed-up item (which includes death_protection) so the player
# retains both the item and continued protection.

summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Tags:["ms_tan_temp"]}
data modify entity @e[tag=ms_tan_temp,limit=1] HandItems[0] set from storage minesouls:offhand_backup Item
item replace entity @s weapon.offhand from entity @e[tag=ms_tan_temp,limit=1] weapon.mainhand
kill @e[tag=ms_tan_temp]
