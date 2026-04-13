# Cheat Death – Restore offhand item consumed by death_protection
# Uses a temporary barrel at build limit to transfer the backed-up item.

setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items append from storage minesouls:cd_offhand_backup Item
item replace entity @s weapon.offhand from block ~ 319 ~ container.0
setblock ~ 319 ~ minecraft:air
