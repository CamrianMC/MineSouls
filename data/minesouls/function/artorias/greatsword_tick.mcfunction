# Greatsword of Artorias tick: applies Night Vision to any player holding the sword in their main hand.
# Refreshed every tick so the effect never expires while the sword is held.
execute as @a if items entity @s weapon.mainhand minecraft:netherite_sword[minecraft:custom_data~{minesouls:{greatsword_of_artorias:true}}] run effect give @s minecraft:night_vision 3 0 true
