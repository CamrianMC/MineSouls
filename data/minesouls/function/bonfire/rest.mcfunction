# Reward function for minesouls:bonfire/resting advancement.
# Runs as the player who is resting at a bonfire.
#
# Effects (skipped while cooldown is active):
#   1. Tellraw "You feel rested." in green (cooldown prevents message spam)
#   2. Regeneration X (amplifier 9) for 1 second
#   3. Estus Flask uses reset to 10; a fresh flask is given if none is held
#   4. Player bonfire coordinates (block position) stored in scoreboards
#   5. Player dimension stored as an integer scoreboard: 0=overworld 1=nether 2=end

# Revoke the advancement immediately so it can re-trigger after the cooldown
advancement revoke @s only minesouls:bonfire/resting

# === Rested effects ===

# Regeneration X (amplifier 9) for 1 second (20 ticks); hide particles
effect give @s minecraft:regeneration 1 9 true

# Skip remaining effects while the cooldown is still ticking down
execute if score @s ms.bonfire_rest matches 1.. run return 1

# Notify the player
tellraw @s {"text":"You feel rested.","color":"green","italic":false}

# Reset Estus Flask: remove any active or depleted flask, then give a fresh full one
clear @s minecraft:honey_bottle[minecraft:custom_data~{minesouls:{estus_flask:true}}]
clear @s minecraft:glass_bottle[minecraft:custom_data~{minesouls:{estus_empty:true}}]
give @s minecraft:honey_bottle[minecraft:custom_name='{"text":"Estus Flask","italic":false,"color":"gold"}',minecraft:lore=['{"text":"An undead favorite. Restores HP","italic":true,"color":"dark_purple"}','{"text":"Uses: 10/10","italic":false,"color":"dark_aqua"}'],minecraft:custom_data={minesouls:{estus_flask:true,estus_uses:10}},minecraft:food={nutrition:0,saturation:0.0},minecraft:item_model="minesouls:estus_flask"] 1
scoreboard players set @s ms.estus_uses 10

# Mark that this player has a bonfire set (used by respawn-teleport logic)
scoreboard players set @s ms.has_bonfire 1

# Store the player's bonfire coordinates (block position)
execute store result score @s ms.bonfire_x run data get entity @s Pos[0] 1
execute store result score @s ms.bonfire_y run data get entity @s Pos[1] 1
execute store result score @s ms.bonfire_z run data get entity @s Pos[2] 1

# Store the player's current dimension: 0 = overworld, 1 = nether, 2 = end
execute if predicate minesouls:in_overworld run scoreboard players set @s ms.bonfire_dim 0
execute if predicate minesouls:in_nether run scoreboard players set @s ms.bonfire_dim 1
execute if predicate minesouls:in_end run scoreboard players set @s ms.bonfire_dim 2

# Set cooldown to 200 ticks (10 seconds) to prevent message and effect spam
scoreboard players set @s ms.bonfire_rest 200

# Give the player a Darksign (silently refused if they already have one)
function minesouls:darksign/give

# Give the player a Flask of Wondrous Physik (silently refused if already held)
function minesouls:flask_of_wondrous_physik/give

# Give the player a Class Book (silently refused if already held)
function minesouls:class_book/give
