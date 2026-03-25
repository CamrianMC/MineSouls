# Serious Parkour – Rogue Tier 2 Perk 3
# Landing from >=2 blocks grants Speed I and Jump Boost I for 10 seconds.
# Tracks FallDistance NBT each tick to detect landings.

# Initialize max tracker if not yet set
scoreboard players add @s ms.sp_max 0

# Store current FallDistance (scaled by 100: 2 blocks = 200)
execute store result score @s ms.sp_fall run data get entity @s fall_distance 100

# Update max fall distance if currently falling and this is a new peak
execute if score @s ms.sp_fall matches 1.. if score @s ms.sp_fall > @s ms.sp_max run scoreboard players operation @s ms.sp_max = @s ms.sp_fall

# If just landed (FallDistance is 0) and max fall >= 200 (2 blocks), trigger effect
execute if score @s ms.sp_fall matches 0 if score @s ms.sp_max matches 200.. run function minesouls:perk/rogue/t2/serious_parkour_land

# Reset max when not falling
execute if score @s ms.sp_fall matches 0 run scoreboard players set @s ms.sp_max 0
