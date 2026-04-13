# Cast – Identify the held spellbook and route to the correct T5 spell.
# Runs as the Mage who right-clicked, at the Mage's position.

# Check mainhand first, then offhand
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:13}}] run return run function minesouls:perk/mage/t5/armageddon
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:14}}] run return run function minesouls:perk/mage/t5/acheron
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:15}}] run return run function minesouls:perk/mage/t5/fountain_of_youth
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:13}}] run return run function minesouls:perk/mage/t5/armageddon
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:14}}] run return run function minesouls:perk/mage/t5/acheron
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:15}}] run return run function minesouls:perk/mage/t5/fountain_of_youth
