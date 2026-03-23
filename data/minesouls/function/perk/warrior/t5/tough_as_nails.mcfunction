# Tough as Nails – Warrior Tier 5 Perk 2
# Cannot take more than 5 damage in one hit.
# Tracks health each tick and heals back excess damage beyond 5 HP.

# Calculate damage taken since last tick: damage = prev - current
scoreboard players operation @s ms.tan_dmg = @s ms.tan_prev
scoreboard players operation @s ms.tan_dmg -= @s ms.health

# If damage is 5 or less (including heals/no change), just update prev and exit
execute if score @s ms.tan_dmg matches ..5 run scoreboard players operation @s ms.tan_prev = @s ms.health
execute if score @s ms.tan_dmg matches ..5 run return 0

# Excess damage detected – calculate amount to heal: heal = damage - 5
scoreboard players remove @s ms.tan_dmg 5

# Heal using instant_health (binary decomposition)
# Amplifier 0 heals 4 HP, amplifier 1 heals 8 HP, amplifier 2 heals 16 HP

# Heal 8 HP if excess >= 9
execute if score @s ms.tan_dmg matches 9.. run effect give @s minecraft:instant_health 1 1 true
execute if score @s ms.tan_dmg matches 9.. run scoreboard players remove @s ms.tan_dmg 8

# Heal 4 HP if excess >= 5
execute if score @s ms.tan_dmg matches 5.. run effect give @s minecraft:instant_health 1 0 true
execute if score @s ms.tan_dmg matches 5.. run scoreboard players remove @s ms.tan_dmg 4

# Heal 4 HP for remaining excess (1-4 HP; may overheal by up to 3 HP)
execute if score @s ms.tan_dmg matches 1.. run effect give @s minecraft:instant_health 1 0 true

# Update prev health (instant_health applies immediately, so ms.health is post-heal)
scoreboard players operation @s ms.tan_prev = @s ms.health
