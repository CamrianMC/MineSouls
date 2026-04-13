# Cast – Identify the held spellbook and route to the correct T3 spell.
# Runs as the Mage who right-clicked, at the Mage's position.

# Check mainhand first, then offhand
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:7}}] run return run function minesouls:perk/mage/t3/hurricane
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:8}}] run return run function minesouls:perk/mage/t3/druid
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:9}}] run return run function minesouls:perk/mage/t3/abandon_ship
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:7}}] run return run function minesouls:perk/mage/t3/hurricane
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:8}}] run return run function minesouls:perk/mage/t3/druid
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:9}}] run return run function minesouls:perk/mage/t3/abandon_ship
