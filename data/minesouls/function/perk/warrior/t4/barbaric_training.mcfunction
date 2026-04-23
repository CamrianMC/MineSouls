# Barbaric Training – Warrior Tier 4 Perk 2
# Increases melee damage by 20% when off hand is empty.

# If offhand has an item, remove modifier and stop
execute if items entity @s weapon.offhand * if entity @s[tag=ms_barbaric_active] run attribute @s minecraft:attack_damage modifier remove minesouls:barbaric_training
execute if items entity @s weapon.offhand * run tag @s remove ms_barbaric_active
execute if items entity @s weapon.offhand * run return 0

# Offhand is empty: apply damage boost
execute unless entity @s[tag=ms_barbaric_active] run attribute @s minecraft:attack_damage modifier add minesouls:barbaric_training 0.4 add_multiplied_base
tag @s add ms_barbaric_active
