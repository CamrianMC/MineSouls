# Cast – Identify the held spellbook and route to the correct T2 spell.
# Runs as the Mage who right-clicked, at the Mage's position.

# Check mainhand first, then offhand
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:4}}] run return run function minesouls:perk/mage/t2/fireball
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:5}}] run return run function minesouls:perk/mage/t2/frosty
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:6}}] run return run function minesouls:perk/mage/t2/light_barrier
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:4}}] run return run function minesouls:perk/mage/t2/fireball
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:5}}] run return run function minesouls:perk/mage/t2/frosty
execute if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{minesouls:{spellbook:6}}] run return run function minesouls:perk/mage/t2/light_barrier
