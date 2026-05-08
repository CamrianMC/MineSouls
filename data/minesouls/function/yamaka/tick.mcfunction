# Yamaka tick: applies Hero of the Village (amplifier 0) for 3 seconds to any
# player who is currently wearing the Yamaka as their helmet.
# Running every tick ensures the effect never expires while the item is worn.

execute as @a if items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{minesouls:{yamaka:true}}] run effect give @s minecraft:hero_of_the_village 3 0 true
