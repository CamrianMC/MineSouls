# Adrenaline Rush – Warrior Tier 4 Perk 1
# Boosts speed, haste, and melee damage by 40% when <= 50% HP.
# Health is tracked by the ms.health scoreboard (health criterion; 20 = full).

# If above 50% HP, remove boosts and stop
execute if score @s ms.health matches 11.. if entity @s[tag=ms_adrenaline_active] run attribute @s minecraft:attack_damage modifier remove minesouls:adrenaline_rush
execute if score @s ms.health matches 11.. run tag @s remove ms_adrenaline_active
execute if score @s ms.health matches 11.. run return 0

# At or below 50% HP: apply boosts (effects refreshed every tick)
effect give @s minecraft:speed 1 1 true
effect give @s minecraft:haste 1 1 true
execute unless entity @s[tag=ms_adrenaline_active] run attribute @s minecraft:attack_damage modifier add minesouls:adrenaline_rush 0.4 add_multiplied_base
tag @s add ms_adrenaline_active
