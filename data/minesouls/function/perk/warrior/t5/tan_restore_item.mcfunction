# Tough as Nails – Restore offhand item consumed by death_protection
# Uses a temporary barrel at build limit to transfer the backed-up item.
# The backup already has Slot:0b set at protect time.

tellraw @s [{"text":"[TaN] Restore: storage = ","color":"gray"},{"nbt":"Item","storage":"minesouls:offhand_backup","color":"yellow"}]
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items append from storage minesouls:offhand_backup Item
tellraw @s [{"text":"[TaN] Barrel Items = ","color":"gray"},{"nbt":"Items","block":"~ 319 ~","color":"yellow"}]
item replace entity @s weapon.offhand from block ~ 319 ~ container.0
setblock ~ 319 ~ minecraft:air