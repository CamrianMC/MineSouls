# Darkwraith – Initialisation.
# Runs as an untagged wither_skeleton in the Abyss dimension (called from global tick).
# Converts it into a fully-configured Darkwraith: armored, persistent, named, buffed stats.

# Tag immediately to prevent re-processing on future ticks
tag @s add ms_darkwraith

# Persistence: never despawn
data merge entity @s {PersistenceRequired:1b}

# Identity: purple custom name visible at all times
data merge entity @s {CustomName:'{"text":"Darkwraith","color":"dark_purple","italic":false}',CustomNameVisible:1b}

# Stats: 40 HP (20 hearts) — double the wither skeleton default
attribute @s minecraft:max_health base set 40.0
data merge entity @s {Health:40.0f}

# Equipment: full chainmail with Protection I on chest + legs; iron sword Sharpness II
item replace entity @s armor.head with minecraft:chainmail_helmet[minecraft:unbreakable={}]
item replace entity @s armor.chest with minecraft:chainmail_chestplate[minecraft:enchantments={levels:{"minecraft:protection":1}},minecraft:unbreakable={}]
item replace entity @s armor.legs with minecraft:chainmail_leggings[minecraft:enchantments={levels:{"minecraft:protection":1}},minecraft:unbreakable={}]
item replace entity @s armor.feet with minecraft:chainmail_boots[minecraft:unbreakable={}]
item replace entity @s weapon.mainhand with minecraft:iron_sword[minecraft:enchantments={levels:{"minecraft:sharpness":2}},minecraft:unbreakable={}]
