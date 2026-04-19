# Beast Mastery – Heal the Ranger 2 HP when their wolf deals damage.
# Runs as the Ranger (wolf's owner).

#tellraw @s {"text":"heal!"}
effect give @s minecraft:regeneration 2 2 true

# Subtle heal feedback
particle minecraft:heart ~ ~2 ~ 0.3 0.2 0.3 0 2
