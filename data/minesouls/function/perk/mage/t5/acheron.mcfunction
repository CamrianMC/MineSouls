# Acheron – Mage Tier 5 Perk 2
# Summons a Wither that targets nearby hostile mobs. Lasts 20 seconds.
# Limit 1 at a time. Costs 2000 mana.

# Check mana
execute unless score @s ms.mana matches 2000.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 2000.. run return 0

# Check for existing acheron wither (limit 1)
execute if score @s ms.acheron_active matches 1 run tellraw @s {"text":"Your Wither is still active!","color":"red"}
execute if score @s ms.acheron_active matches 1 run return 0

# Consume mana
scoreboard players remove @s ms.mana 2000

# Summon a wither above the player (3 blocks up to avoid collision damage)
summon minecraft:wither ~ ~3 ~ {Tags:["ms_acheron","ms_acheron_new"],PersistenceRequired:1b,CustomName:'{"text":"Acheron","color":"dark_red"}',CustomNameVisible:1b}

# Give glowing effect (31 seconds, covers the full 30s lifetime)
effect give @e[type=minecraft:wither,tag=ms_acheron_new] minecraft:glowing 31 0 true

# Set player state
scoreboard players set @s ms.acheron_active 1
scoreboard players set @s ms.acheron_timer 600

# Cleanup new tag
tag @e[tag=ms_acheron_new] remove ms_acheron_new

# Feedback
playsound minecraft:entity.wither.spawn player @a[distance=..64] ~ ~ ~ 1 1
tellraw @s [{"text":"Acheron rises!","color":"dark_red","bold":true}]
particle minecraft:soul_fire_flame ~ ~3 ~ 1.0 0.5 1.0 0.1 30
