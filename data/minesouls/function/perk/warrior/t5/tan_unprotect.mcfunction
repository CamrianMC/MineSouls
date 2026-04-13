# Tough as Nails – Remove death_protection from offhand (called when at or below 5hp)
# The 5-HP cap cannot save the player at this health, so death_protection
# should not interfere with natural death.

# Remove our knowledge book if present
execute if items entity @s weapon.offhand minecraft:knowledge_book[minecraft:custom_data~{ms_tan:1b}] run clear @s minecraft:knowledge_book[minecraft:custom_data~{ms_tan:1b}] 1

# If we haven't protected a real item, nothing more to do
execute unless entity @s[tag=ms_tan_protected] run return 0

# Totem of undying: don't strip its native death_protection
execute if items entity @s weapon.offhand minecraft:totem_of_undying run tag @s remove ms_tan_protected
execute if items entity @s weapon.offhand minecraft:totem_of_undying run return 0

# Offhand is empty (item was removed or consumed): just clean up tag
execute unless items entity @s weapon.offhand * run tag @s remove ms_tan_protected
execute unless items entity @s weapon.offhand * run return 0

# Real item with our death_protection: strip via barrel intermediary
setblock ~ 319 ~ minecraft:barrel
item replace block ~ 319 ~ container.0 from entity @s weapon.offhand
data remove block ~ 319 ~ Items[0].components."minecraft:death_protection"
data remove block ~ 319 ~ Items[0].components."minecraft:custom_data".ms_tan_dp
item replace entity @s weapon.offhand from block ~ 319 ~ container.0
setblock ~ 319 ~ minecraft:air
tag @s remove ms_tan_protected
