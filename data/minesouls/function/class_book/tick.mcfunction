# Class book tick – runs once per tick for every player.
# Enables triggers, processes selections, and removes the book when off bedrock.

# Enable trigger scoreboards so the player can use /trigger
scoreboard players enable @s ms.class_select
scoreboard players enable @s ms.perk_select
scoreboard players enable @s ms.classperk_reset
scoreboard players enable @s ms.class_wipe

# Process class selection if triggered
execute if score @s ms.class_select matches 1.. run function minesouls:class_book/select_class

# Process perk selection if triggered
execute if score @s ms.perk_select matches 1.. run function minesouls:class_book/select_perk

# Process class reset confirmation if triggered
execute if score @s ms.classperk_reset matches 1.. run function minesouls:class_book/perk/reset_confimation

# Process class wipe if confirmed
execute if score @s ms.class_wipe matches 1.. run function minesouls:class_book/perk/reset_all

# Remove the class book when the player no longer has regeneration
execute if items entity @s container.* minecraft:written_book[minecraft:custom_data~{minesouls:{class_book:true}}] unless entity @s[nbt={active_effects:[{id:"minecraft:regeneration"}]}] run clear @s minecraft:written_book[minecraft:custom_data~{minesouls:{class_book:true}}]
