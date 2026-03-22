# Handle perk selection trigger.
# Trigger value encodes class*100 + tier*10 + perk (e.g. 321 = Ranger Tier 2 Perk 1).

# Store value and reset trigger immediately
scoreboard players operation @s ms.cb_temp = @s ms.perk_select
scoreboard players set @s ms.perk_select 0

# --- Validate the player has a class ---
execute unless score @s ms.class matches 1.. run tellraw @s {"text":"You must select a class first!","color":"red"}
execute unless score @s ms.class matches 1.. run return 0

# --- Quick range check ---
execute unless score @s ms.cb_temp matches 111..453 run tellraw @s {"text":"Invalid perk selection!","color":"red"}
execute unless score @s ms.cb_temp matches 111..453 run return 0

# --- Extract class digit (hundreds) and validate it matches the player's class ---
scoreboard players operation @s ms.cb_class = @s ms.cb_temp
scoreboard players operation @s ms.cb_class /= #100 ms.const
execute unless score @s ms.cb_class = @s ms.class run tellraw @s {"text":"That perk is not available for your class!","color":"red"}
execute unless score @s ms.cb_class = @s ms.class run return 0

# --- Extract tier digit (tens) ---
scoreboard players operation @s ms.cb_tier = @s ms.cb_temp
scoreboard players operation @s ms.cb_tier %= #100 ms.const
scoreboard players operation @s ms.cb_tier /= #10 ms.const
execute unless score @s ms.cb_tier matches 1..5 run tellraw @s {"text":"Invalid tier!","color":"red"}
execute unless score @s ms.cb_tier matches 1..5 run return 0

# --- Extract perk digit (ones) ---
scoreboard players operation @s ms.cb_perk = @s ms.cb_temp
scoreboard players operation @s ms.cb_perk %= #10 ms.const
execute unless score @s ms.cb_perk matches 1..3 run tellraw @s {"text":"Invalid perk!","color":"red"}
execute unless score @s ms.cb_perk matches 1..3 run return 0

# --- Route to the correct tier handler ---
execute if score @s ms.cb_tier matches 1 run function minesouls:class_book/perk/tier1
execute if score @s ms.cb_tier matches 2 run function minesouls:class_book/perk/tier2
execute if score @s ms.cb_tier matches 3 run function minesouls:class_book/perk/tier3
execute if score @s ms.cb_tier matches 4 run function minesouls:class_book/perk/tier4
execute if score @s ms.cb_tier matches 5 run function minesouls:class_book/perk/tier5
