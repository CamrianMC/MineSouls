# Fountain of Youth – Mage Tier 5 Perk 3
# Fully and instantly heals all players within 20 blocks of the user.
# Uses instant_health with high amplifier to fully heal (amp 6 = 128 HP, enough for any player).
# Costs 2000 mana.

# Check mana
execute unless score @s ms.mana matches 2000.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 2000.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 2000

# Fully heal all players within 20 blocks (amp 6 = 128 HP, covers max health)
effect give @a[distance=..20] minecraft:instant_health 1 6 true

# Visual and audio feedback at caster location
playsound minecraft:block.beacon.activate player @a[distance=..32] ~ ~ ~ 1 1.5
particle minecraft:heart ~ ~2 ~ 3 1 3 0.1 30
particle minecraft:happy_villager ~ ~1 ~ 5 2 5 0.5 50

# Notify all healed players
tellraw @a[distance=..20] [{"selector":"@s","color":"dark_purple"},{"text":" cast ","color":"gray"},{"text":"Fountain of Youth!","color":"aqua","bold":true},{"text":" All nearby players fully healed!","color":"green"}]
