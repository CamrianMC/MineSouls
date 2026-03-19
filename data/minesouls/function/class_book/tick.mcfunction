# Class book tick – runs once per tick for every player.
# Enables triggers, processes selections, and removes the book when off bedrock.

# Enable trigger scoreboards so the player can use /trigger
scoreboard players enable @s ms.class_select
scoreboard players enable @s ms.perk_select

# Process class selection if triggered
execute if score @s ms.class_select matches 1.. run function minesouls:class_book/select_class

# Process perk selection if triggered
execute if score @s ms.perk_select matches 1.. run function minesouls:class_book/select_perk

# Remove the class book when the player is no longer standing on bedrock
execute if items entity @s container.* minecraft:written_book[minecraft:custom_data~{minesouls:{class_book:true}}] unless predicate minesouls:on_bedrock run clear @s minecraft:written_book[minecraft:custom_data~{minesouls:{class_book:true}}]
