# Cast – Identify the held spellbook and route to the correct T4 spell.
# Runs as the Mage who right-clicked, at the Mage's position.

# Check mainhand first, then offhand
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:10}}] run return run function minesouls:perk/mage/t4/zeus
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:11}}] run return run function minesouls:perk/mage/t4/bodyguard
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:12}}] run return run function minesouls:perk/mage/t4/blink
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:10}}] run return run function minesouls:perk/mage/t4/zeus
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:11}}] run return run function minesouls:perk/mage/t4/bodyguard
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:12}}] run return run function minesouls:perk/mage/t4/blink
