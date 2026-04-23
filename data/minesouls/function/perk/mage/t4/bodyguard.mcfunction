# Bodyguard – Mage Tier 4 Perk 2
# Summons two iron golems that attack nearby hostiles. They last 30 seconds.
# Limit 1 pair at a time. Costs 800 mana.

# Check mana
execute unless score @s ms.mana matches 800.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 800.. run return 0

# Check for existing bodyguards (limit 1 pair)
execute if score @s ms.bodyguard_active matches 1 run tellraw @s {"text":"Your bodyguards are still active!","color":"red"}
execute if score @s ms.bodyguard_active matches 1 run return 0

# Consume mana
scoreboard players remove @s ms.mana 800

# Summon 2 iron golems flanking the player
summon minecraft:iron_golem ~2 ~ ~ {Tags:["ms_bodyguard","ms_bodyguard_new"],PersistenceRequired:1b,PlayerCreated:0b,CustomName:{"text":"Bodyguard","color":"gold"},CustomNameVisible:1b}
summon minecraft:iron_golem ~-2 ~ ~ {Tags:["ms_bodyguard","ms_bodyguard_new"],PersistenceRequired:1b,PlayerCreated:0b,CustomName:{"text":"Bodyguard","color":"gold"},CustomNameVisible:1b}

# Give glowing effect (31 seconds, covers the full 30s lifetime)
effect give @e[type=minecraft:iron_golem,tag=ms_bodyguard_new] minecraft:glowing 31 0 true

# Set player state
scoreboard players set @s ms.bodyguard_active 1
scoreboard players set @s ms.bodyguard_timer 600

# Cleanup new tag
tag @e[tag=ms_bodyguard_new] remove ms_bodyguard_new

# Feedback
playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1 1
# tellraw @s [{"text":"Bodyguards summoned!","color":"gold"}]
particle minecraft:happy_villager ~ ~1 ~ 1.0 0.5 1.0 0.1 20
