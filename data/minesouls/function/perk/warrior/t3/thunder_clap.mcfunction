# Thunder Clap – Warrior Tier 3 Perk 1
# Landing on the ground from a >=2 block fall damages and knocks back nearby enemies.
# Tracks FallDistance NBT each tick to detect landings.

# Initialize max tracker if not yet set
scoreboard players add @s ms.tc_max 0

# Store current FallDistance (scaled by 100 for integer precision: 2 blocks = 200)
execute store result score @s ms.tc_fall run data get entity @s fall_distance 100

# Update max fall distance if currently falling and this is a new peak
execute if score @s ms.tc_fall matches 1.. if score @s ms.tc_fall > @s ms.tc_max run scoreboard players operation @s ms.tc_max = @s ms.tc_fall

# If just landed (FallDistance is 0) and max fall >= 200 (2 blocks), trigger effect
execute if score @s ms.tc_fall matches 0 if score @s ms.tc_max matches 200.. run function minesouls:perk/warrior/t3/thunder_clap_land

# Reset max when not falling
execute if score @s ms.tc_fall matches 0 run scoreboard players set @s ms.tc_max 0
