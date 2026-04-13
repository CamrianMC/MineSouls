# Zeus – Mage Tier 4 Perk 1
# Fires a bolt of lightning at the block the player is looking at.
# Uses a raycast to find the target block, then summons lightning there.
# Costs 400 mana.

# Check mana
execute unless score @s ms.mana matches 400.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 400.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 400

# Raycast: step forward from eyes in the look direction to find the target
# Initialize step counter
scoreboard players set @s ms.zeus_steps 0

# Start raycast from eye position
execute anchored eyes positioned ^ ^ ^0 run function minesouls:perk/mage/t4/zeus_raycast

# Feedback
playsound minecraft:item.trident.thunder player @a[distance=..64] ~ ~ ~ 1 1
tellraw @s [{"text":"Zeus!","color":"yellow"}]
