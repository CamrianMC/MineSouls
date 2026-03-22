# Handle class selection trigger.
# Runs when ms.class_select >= 1.

# Store value and reset trigger immediately
scoreboard players operation @s ms.cb_temp = @s ms.class_select
scoreboard players set @s ms.class_select 0

# Reject if the player already has a class
execute if score @s ms.class matches 1.. run tellraw @s {"text":"You have already chosen a class!","color":"red"}
execute if score @s ms.class matches 1.. run return 0

# Reject invalid values
execute unless score @s ms.cb_temp matches 1..4 run tellraw @s {"text":"Invalid class selection!","color":"red"}
execute unless score @s ms.cb_temp matches 1..4 run return 0

# Set class
scoreboard players operation @s ms.class = @s ms.cb_temp

# Confirm to the player
execute if score @s ms.class matches 1 run tellraw @s [{"text":"You have chosen the path of the ","color":"green"},{"text":"Warrior","color":"dark_red","bold":true},{"text":"!","color":"green"}]
execute if score @s ms.class matches 2 run tellraw @s [{"text":"You have chosen the path of the ","color":"green"},{"text":"Rogue","color":"dark_green","bold":true},{"text":"!","color":"green"}]
execute if score @s ms.class matches 3 run tellraw @s [{"text":"You have chosen the path of the ","color":"green"},{"text":"Ranger","color":"dark_aqua","bold":true},{"text":"!","color":"green"}]
execute if score @s ms.class matches 4 run tellraw @s [{"text":"You have chosen the path of the ","color":"green"},{"text":"Mage","color":"dark_purple","bold":true},{"text":"!","color":"green"}]
