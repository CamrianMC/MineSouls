# Cheat Death – Remove death_protection from offhand (called when cooldown is active)
# While on cooldown, Cheat Death should not prevent death.

# Remove our knowledge book if present
execute if items entity @s weapon.offhand minecraft:knowledge_book[minecraft:custom_data~{ms_cd:1b}] run clear @s minecraft:knowledge_book[minecraft:custom_data~{ms_cd:1b}] 1

# If we haven't protected a real item, nothing more to do
execute unless entity @s[tag=ms_cd_protected] run return 0

# Totem of undying: don't strip its native death_protection
execute if items entity @s weapon.offhand minecraft:totem_of_undying run tag @s remove ms_cd_protected
execute if items entity @s weapon.offhand minecraft:totem_of_undying run return 0

# Offhand is empty (item was removed or consumed): just clean up tag
execute unless items entity @s weapon.offhand * run tag @s remove ms_cd_protected
execute unless items entity @s weapon.offhand * run return 0

# Real item with our death_protection: strip via barrel intermediary
setblock ~ 319 ~ minecraft:barrel
item replace block ~ 319 ~ container.0 from entity @s weapon.offhand
data remove block ~ 319 ~ Items[0].components."minecraft:death_protection"
data remove block ~ 319 ~ Items[0].components."minecraft:custom_data".ms_cd_dp
item replace entity @s weapon.offhand from block ~ 319 ~ container.0
setblock ~ 319 ~ minecraft:air
tag @s remove ms_cd_protected
