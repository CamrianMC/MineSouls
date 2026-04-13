# Cheat Death – Ensure death_protection on offhand (called when cooldown is 0)
# Prevents fatal hits from killing the player so the hit function can activate.

# Already our CD knowledge book? Nothing to do
execute if items entity @s weapon.offhand minecraft:knowledge_book[minecraft:custom_data~{ms_cd:1b}] run return 0

# Totem of undying has native death_protection, skip
execute if items entity @s weapon.offhand minecraft:totem_of_undying run return 0

# Item already has our death_protection marker? Update backup via barrel and done
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_cd_dp:1b}] run setblock ~ 319 ~ minecraft:barrel
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_cd_dp:1b}] run item replace block ~ 319 ~ container.0 from entity @s weapon.offhand
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_cd_dp:1b}] run data modify storage minesouls:cd_offhand_backup Item set from block ~ 319 ~ Items[0]
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_cd_dp:1b}] run setblock ~ 319 ~ minecraft:air
execute if items entity @s weapon.offhand *[minecraft:custom_data~{ms_cd_dp:1b}] run return 0

# Real item without our marker: add death_protection, backup via barrel, tag player
execute if items entity @s weapon.offhand * run item modify entity @s weapon.offhand minesouls:add_death_protection_cd
execute if items entity @s weapon.offhand * run setblock ~ 319 ~ minecraft:barrel
execute if items entity @s weapon.offhand * run item replace block ~ 319 ~ container.0 from entity @s weapon.offhand
execute if items entity @s weapon.offhand * run data modify storage minesouls:cd_offhand_backup Item set from block ~ 319 ~ Items[0]
execute if items entity @s weapon.offhand * run setblock ~ 319 ~ minecraft:air
execute if items entity @s weapon.offhand * run tag @s add ms_cd_protected
execute if items entity @s weapon.offhand * run return 0

# Offhand is empty: give knowledge book with death_protection
item replace entity @s weapon.offhand with minecraft:knowledge_book[minecraft:death_protection={death_effects:[]},minecraft:custom_data={ms_cd:1b}] 1
