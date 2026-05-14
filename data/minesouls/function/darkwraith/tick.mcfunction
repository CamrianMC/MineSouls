# Per-entity tick for Darkwraith skeletons.
# Called via: execute as @e[tag=ms_darkwraith] at @s run function minesouls:darkwraith/tick

# Lifesteal: detect when an adjacent player was struck this tick (HurtTime 10 = first tick of hurt animation)
execute if entity @a[distance=..3,nbt={HurtTime:10s}] run function minesouls:darkwraith/lifesteal
execute unless entity @a[distance=..3,nbt={HurtTime:10s}] if entity @a[distance=..3,nbt={HurtTime:9s}] run function minesouls:darkwraith/lifesteal

# Keep silence enforced every tick
data merge entity @s {Silent:1b}

# Darkness aura: gain Strength 1 while standing in darkness
execute if predicate minesouls:in_darkness run effect give @s minecraft:strength 3 0 true
