# Cast – Identify the held spellbook and route to the correct spell.
# Runs as the Mage who right-clicked, at the Mage's position.

# Check mainhand first, then offhand
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:1}}] run return run function minesouls:perk/mage/t1/snowball
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:2}}] run return run function minesouls:perk/mage/t1/goyim
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:3}}] run return run function minesouls:perk/mage/t1/bandaid
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:1}}] run return run function minesouls:perk/mage/t1/snowball
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:2}}] run return run function minesouls:perk/mage/t1/goyim
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:3}}] run return run function minesouls:perk/mage/t1/bandaid
