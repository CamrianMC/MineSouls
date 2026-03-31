# Tough as Nails – Ensure death_protection on offhand (called when above 5hp)
# Prevents fatal hits from killing the player before the damage cap can heal.

# Already our TaN knowledge book? Nothing to do
execute if items entity @s weapon.offhand minecraft:knowledge_book[minecraft:custom_data~{ms_tan:1b}] run return 0

# Totem of undying has native death_protection, skip
execute if items entity @s weapon.offhand minecraft:totem_of_undying run return 0

# Item already has our death_protection marker? Update backup and done
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_tan_dp:1b}] run data modify storage minesouls:offhand_backup Item set from entity @s Inventory[{Slot:-106b}]
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_tan_dp:1b}] run return 0

# Real item without our marker: add death_protection, backup, tag player
execute if items entity @s weapon.offhand * run item modify entity @s weapon.offhand minesouls:add_death_protection
execute if items entity @s weapon.offhand * run data modify storage minesouls:offhand_backup Item set from entity @s Inventory[{Slot:-106b}]
execute if items entity @s weapon.offhand * run tag @s add ms_tan_protected
execute if items entity @s weapon.offhand * run return 0

# Offhand is empty: give knowledge book with death_protection
item replace entity @s weapon.offhand with minecraft:knowledge_book[minecraft:death_protection={death_effects:[]},minecraft:custom_data={ms_tan:1b}] 1
