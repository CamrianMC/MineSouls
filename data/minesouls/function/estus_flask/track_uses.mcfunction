# Called every tick for each player (@s).
# Resets the scoreboard to 0, then overwrites it with the estus_uses value
# stored in the custom_data of the item currently held in the main hand.
# If the player is not holding an Estus Flask the score stays at 0.

scoreboard players set @s ms.estus_uses 0
execute store result score @s ms.estus_uses run data get entity @s SelectedItem.components."minecraft:custom_data".minesouls.estus_uses
