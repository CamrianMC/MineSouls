# Second Wind – Warrior Tier 2 Perk 2
# Slowly restore health while below 50% HP (below 10 HP / 20 HP max).
# Heals ~1 HP every 3 seconds via a periodic Regeneration I burst.

# Get current health (integer, truncated)
execute store result score @s ms.health run data get entity @s Health 1

# If health is at or above 50% (10+ HP), reset timer and stop
execute if score @s ms.health matches 10.. run scoreboard players set @s ms.second_wind 0
execute if score @s ms.health matches 10.. run return 0

# Increment timer
scoreboard players add @s ms.second_wind 1

# Every 60 ticks (~3 seconds), apply Regeneration I for 3 seconds.
# The regen effect heals ~1 HP during its 3-second window.
execute if score @s ms.second_wind matches 60.. run effect give @s minecraft:regeneration 3 0 true
execute if score @s ms.second_wind matches 60.. run scoreboard players set @s ms.second_wind 0
