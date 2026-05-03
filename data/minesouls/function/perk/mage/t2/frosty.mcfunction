# Frosty – Mage Tier 2 Perk 2
# Summons a snow golem turret that fires snowballs at hostile mobs.
# Each snowball deals 1 damage. The snow golem lasts 30 seconds.
# Limit 1 at a time. Costs 200 mana.

# Check mana
execute unless score @s ms.mana matches 200.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 200.. run return 0

# Check for existing frosty (limit 1)
# execute if score @s ms.frosty_active matches 1 run tellraw @s {"text":"Your Frosty is still active!","color":"red"}
execute if score @s ms.frosty_active matches 1 run return 0

# Consume mana
scoreboard players remove @s ms.mana 200

# Summon snow golem at player position (NoAI turret, extra HP to survive warm biomes)
summon minecraft:snow_golem ^ ^1 ^1 {Tags:["ms_frosty","ms_frosty_new"],Invulnerable:1b,PersistenceRequired:1b,CustomName:{"text":"Nwah","color":"aqua"},CustomNameVisible:1b}

# Set max health to 40 and heal to full
attribute @e[type=minecraft:snow_golem,tag=ms_frosty_new,limit=1] minecraft:max_health base set 40
effect give @e[type=minecraft:snow_golem,tag=ms_frosty_new,limit=1] minecraft:instant_health 1 4 true

# Give glowing effect (31 seconds, covers the full 30s lifetime)
effect give @e[type=minecraft:snow_golem,tag=ms_frosty_new,limit=1] minecraft:glowing 31 0 true

# Stamp entity-side lifetime timer so the summon expires even if the owner is absent
scoreboard players set @e[type=minecraft:snow_golem,tag=ms_frosty_new,limit=1] ms.lifetime 600

# Initialize fire rate timer on the golem
scoreboard players set @e[type=minecraft:snow_golem,tag=ms_frosty_new,limit=1] ms.frosty_fire 0

# Set player state
scoreboard players set @s ms.frosty_active 1
scoreboard players set @s ms.frosty_timer 600

# Cleanup new tag
tag @e[tag=ms_frosty_new] remove ms_frosty_new

# Feedback
playsound minecraft:entity.evoker.cast_spell player @s ~ ~ ~ 1 1
# tellraw @s [{"text":"Frosty summoned!","color":"aqua"}]
particle minecraft:snowflake ~ ~1 ~ 0.3 0.5 0.3 0.1 20
