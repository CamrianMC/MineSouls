# Blink – Mage Tier 4 Perk 3
# Instantly teleports the player forward 10 blocks in their look direction.
# Costs 200 mana.

# Check mana
execute unless score @s ms.mana matches 200.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 200.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 200

# Particle trail at origin
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.5 0.3 0.05 20

# Teleport 10 blocks forward in look direction (relative to eyes for correct direction)
execute anchored eyes run tp @s ^ ^ ^10

# Particle burst at destination
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.5 0.3 0.05 20

# Feedback
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1
tellraw @s [{"text":"Blink!","color":"light_purple"}]
