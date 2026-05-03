# Goyim – Mage Tier 1 Perk 2
# Summons a nitwit villager that attracts all hostile mobs within 20 blocks.
# The nitwit dies after 15 seconds. Limit 1 at a time. Costs 200 mana.

# Check mana
execute unless score @s ms.mana matches 200.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 200.. run return 0

# Check for existing goyim (limit 1)
# execute if score @s ms.goyim_active matches 1 run tellraw @s {"text":"Your Goyim is still active!","color":"red"}
execute if score @s ms.goyim_active matches 1 run return 0

# Consume mana
scoreboard players remove @s ms.mana 200

# Summon nitwit villager at player position
summon minecraft:villager ^ ^1 ^1 {Tags:["ms_goyim","ms_goyim_new"],VillagerData:{profession:"minecraft:nitwit",level:1,type:"minecraft:plains"},PersistenceRequired:1b,CustomName:{"text":"Goyim","color":"dark_purple"},CustomNameVisible:1b}

# Give goyim glowing effect (16 seconds, covers the full 15s lifetime)
effect give @e[type=minecraft:villager,tag=ms_goyim_new,limit=1] minecraft:glowing 16 0 true

# Stamp entity-side lifetime timer so the summon expires even if the owner is absent
scoreboard players set @e[type=minecraft:villager,tag=ms_goyim_new,limit=1] ms.lifetime 300

# Set player state
scoreboard players set @s ms.goyim_active 1
scoreboard players set @s ms.goyim_timer 300

# Cleanup new tag
tag @e[tag=ms_goyim_new] remove ms_goyim_new

# Feedback
playsound minecraft:entity.evoker.cast_spell player @s ~ ~ ~ 1 1
# tellraw @s [{"text":"Goyim summoned!","color":"dark_purple"}]
particle minecraft:witch ~ ~1 ~ 0.3 0.5 0.3 0.1 15