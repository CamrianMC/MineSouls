# Druid – Mage Tier 3 Perk 2
# Summons 4 wolves that attack the nearest hostile mob. They last 30 seconds.
# Limit 1 pack at a time. Costs 300 mana.

# Check mana
execute unless score @s ms.mana matches 300.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 300.. run return 0

# Check for existing druid wolves (limit 1 pack)
execute if score @s ms.druid_active matches 1 run tellraw @s {"text":"Your wolves are still active!","color":"red"}
execute if score @s ms.druid_active matches 1 run return 0

# Consume mana
scoreboard players remove @s ms.mana 300

# Summon 4 wolves around the player
summon minecraft:wolf ~1 ~ ~ {Tags:["ms_druid_wolf","ms_druid_new"],PersistenceRequired:1b,CustomName:{"text":"Druid Wolf","color":"green"},CustomNameVisible:1b}
summon minecraft:wolf ~-1 ~ ~ {Tags:["ms_druid_wolf","ms_druid_new"],PersistenceRequired:1b,CustomName:{"text":"Druid Wolf","color":"green"},CustomNameVisible:1b}
summon minecraft:wolf ~ ~ ~1 {Tags:["ms_druid_wolf","ms_druid_new"],PersistenceRequired:1b,CustomName:{"text":"Druid Wolf","color":"green"},CustomNameVisible:1b}
summon minecraft:wolf ~ ~ ~-1 {Tags:["ms_druid_wolf","ms_druid_new"],PersistenceRequired:1b,CustomName:{"text":"Druid Wolf","color":"green"},CustomNameVisible:1b}

# Tame wolves to this player by copying UUID to Owner field
execute as @e[type=minecraft:wolf,tag=ms_druid_new] run data modify entity @s Owner set from entity @a[scores={ms.class=4,ms.t3_perk=2},sort=nearest,limit=1] UUID

# Set variant to woods for a druid-themed look
execute as @e[type=minecraft:wolf,tag=ms_druid_new] run data modify entity @s variant set value "minecraft:woods"

# Set collar color to green (13) to match druid theme
execute as @e[type=minecraft:wolf,tag=ms_druid_new] run data modify entity @s CollarColor set value 13

# Give wolves glowing effect (31 seconds, covers the full 30s lifetime)
effect give @e[type=minecraft:wolf,tag=ms_druid_new] minecraft:glowing 31 0 true

# Set player state
scoreboard players set @s ms.druid_active 1
scoreboard players set @s ms.druid_timer 600

# Cleanup new tag
tag @e[tag=ms_druid_new] remove ms_druid_new

# Feedback
playsound minecraft:entity.wolf_big.pant player @s ~ ~ ~ 1 1
# tellraw @s [{"text":"The pack answers your call!","color":"green"}]
particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 15
