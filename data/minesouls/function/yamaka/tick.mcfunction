# Yamaka tick: applies Hero of the Village (amplifier 0) for 3 seconds to any
# player who is currently wearing the Yamaka as their helmet.
# Running every tick ensures the effect never expires while the item is worn.

execute as @a if items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{minesouls:{yamaka:true}}] run effect give @s minecraft:hero_of_the_village 3 0 true

# Sin: add 1 sin the first tick a player equips the Yamaka.
# ms_yamaka_equipped tag is present while the item is worn, cleared when removed,
# so each new wear session accrues exactly one sin.
execute as @a if items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{minesouls:{yamaka:true}}] unless entity @s[tag=ms_yamaka_equipped] run scoreboard players add @s ms.sin 1
execute as @a if items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{minesouls:{yamaka:true}}] unless entity @s[tag=ms_yamaka_equipped] run tag @s add ms_yamaka_equipped

# Remove the equipped flag when the Yamaka is no longer worn
execute as @a[tag=ms_yamaka_equipped] unless items entity @s armor.head minecraft:leather_helmet[minecraft:custom_data~{minesouls:{yamaka:true}}] run tag @s remove ms_yamaka_equipped
