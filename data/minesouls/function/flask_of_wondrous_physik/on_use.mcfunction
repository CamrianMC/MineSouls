# Reward function for minesouls:flask_of_wondrous_physik/consumed advancement.
# Runs as the player who just consumed the Flask of Wondrous Physik.
# The flask has one use; it is not re-given after consumption.
#
# Effect groups (determined by ms.physik_type scoreboard):
#   0 – Flask of Healing:      Regen I (5 min) + Regen IV burst (3 sec, ~50% HP)
#   1 – Flask of Strength:     Regen I + Strength I + Haste I (3 min)
#   2 – Flask of Mobility:     Regen I + Jump Boost II + Speed II + Slow Fall (3 min)
#   3 – Flask of Defense:      Regen I + Resistance I (3 min)
#   4 – Flask of the Elements: Regen I (3 min) + Fire Resistance (1 min) + Dolphins Grace II (3 min)
#   5 – Flask of Stealth:      Regen I (3 min) + Invisibility (1 min) + Night Vision (3 min)

# Allow the advancement to trigger again
advancement revoke @s only minesouls:flask_of_wondrous_physik/consumed

# Potion consumption returns a glass bottle; remove it
clear @s minecraft:glass_bottle 1

# Type 0 – Flask of Healing
# Two regeneration effects are applied deliberately in this order:
#   1. Regen IV (3 sec, amplifier 3) – provides the ~50% HP instant burst.
#   2. Regen I  (5 min, amplifier 0) – applied second so MC keeps it as a
#      "lower-bound buffer" behind the higher-amplifier effect. When Regen IV
#      expires after 3 s, Regen I resumes for the remaining ~5 minutes.
# (MC rule: new effect with lower amplifier but longer duration is retained as
#  a buffer; the higher-amplifier effect is shown until it expires.)
execute if score @s ms.physik_type matches 0 run effect give @s minecraft:regeneration 3 3 true
execute if score @s ms.physik_type matches 0 run effect give @s minecraft:regeneration 300 0 true

# Type 1 – Flask of Strength
execute if score @s ms.physik_type matches 1 run effect give @s minecraft:regeneration 180 0 true
execute if score @s ms.physik_type matches 1 run effect give @s minecraft:strength 180 0 true
execute if score @s ms.physik_type matches 1 run effect give @s minecraft:haste 180 0 true

# Type 2 – Flask of Mobility
execute if score @s ms.physik_type matches 2 run effect give @s minecraft:regeneration 180 0 true
execute if score @s ms.physik_type matches 2 run effect give @s minecraft:jump_boost 180 1 true
execute if score @s ms.physik_type matches 2 run effect give @s minecraft:speed 180 1 true
execute if score @s ms.physik_type matches 2 run effect give @s minecraft:slow_falling 180 0 true

# Type 3 – Flask of Defense
execute if score @s ms.physik_type matches 3 run effect give @s minecraft:regeneration 180 0 true
execute if score @s ms.physik_type matches 3 run effect give @s minecraft:resistance 180 0 true

# Type 4 – Flask of the Elements
execute if score @s ms.physik_type matches 4 run effect give @s minecraft:regeneration 180 0 true
execute if score @s ms.physik_type matches 4 run effect give @s minecraft:fire_resistance 60 0 true
execute if score @s ms.physik_type matches 4 run effect give @s minecraft:dolphins_grace 180 1 true

# Type 5 – Flask of Stealth
execute if score @s ms.physik_type matches 5 run effect give @s minecraft:regeneration 180 0 true
execute if score @s ms.physik_type matches 5 run effect give @s minecraft:invisibility 60 0 true
execute if score @s ms.physik_type matches 5 run effect give @s minecraft:night_vision 180 0 true
