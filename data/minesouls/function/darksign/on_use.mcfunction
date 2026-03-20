# Reward function for minesouls:darksign/used advancement.
# Runs as the player who just right-clicked (consumed) the Darksign.
#
# Execution order:
#   1. Revoke the advancement so it can fire again on the next use.
#   2. Give the Darksign back (it was consumed to detect the click).
#   3. If the countdown is already running, increment the click counter and return.
#   4. On the first click: show the message, drain all XP/levels, start the
#      4-second countdown, apply nausea, and play the portal travel sound.

# Allow the advancement to trigger again on the next right-click
advancement revoke @s only minesouls:darksign/used

# Give the Darksign back immediately (the player should always keep it)
give @s minecraft:paper[minecraft:custom_name={"text":"Darksign","italic":false,"color":"dark_red"},minecraft:lore=[{"text":"The mark of an Undead. Returns you home at the cost of your souls.","italic":true,"color":"dark_gray"},{"text":"Activate twice to return to worldspawn.","italic":true,"color":"dark_gray"}],minecraft:custom_data={minesouls:{darksign:true}},minecraft:food={nutrition:0,saturation:0.0,can_always_eat:true},minecraft:consumable={consume_seconds:0.05f,animation:"none",sound:"minecraft:block.anvil.place"},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:item_model="minesouls:darksign"] 1

# If the countdown is already running, just count this click and return
execute if score @s ms.darksign_timer matches 1.. run scoreboard players add @s ms.darksign_clicks 1
execute if score @s ms.darksign_timer matches 1.. run return 0

# === First click: initialise the countdown ===

# Notify the player
tellraw @s {"text":"Returning home...","color":"dark_red","italic":false}

# Consume all experience levels and partial XP, leaving the player at 0
xp set @s 0 levels
xp set @s 0 points

# Apply nausea for the exact duration of the countdown (4 seconds)
effect give @s minecraft:nausea 60 255 false

# Play the nether portal travel sound once at the start of the countdown
execute at @s run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 1 1

# Start the 4-second (80 tick) countdown and record the first click
scoreboard players set @s ms.darksign_timer 80
scoreboard players set @s ms.darksign_clicks 1

# Sound effect on second click
execute if score @s ms.darksign_clicks matches 2.. run execute at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1 1
