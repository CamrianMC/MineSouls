# Knight Artorias – Abyssal Lunge: Hit Detection
# Checks for players in a 2.5-block radius at the boss's current position and
# 1.5 blocks ahead (sweep hitbox). Applies damage, wither, and knockback.
# Runs as the base entity at its position.

# Direct contact damage
execute if score @s ms.arta_phase matches 1 as @a[distance=..2.5] run damage @s 18 minecraft:player_attack
execute if score @s ms.arta_phase matches 2 as @a[distance=..2.5] run damage @s 36 minecraft:player_attack

# Extended forward hitbox (1.5 blocks in facing direction)
execute if score @s ms.arta_phase matches 1 positioned ^ ^ ^1.5 as @a[distance=..2] run damage @s 18 minecraft:player_attack
execute if score @s ms.arta_phase matches 2 positioned ^ ^ ^1.5 as @a[distance=..2] run damage @s 36 minecraft:player_attack

# Apply wither on hit (Abyss corruption feel)
execute as @a[distance=..2.5] run effect give @s minecraft:wither 3 0 true
execute positioned ^ ^ ^1.5 as @a[distance=..2] run effect give @s minecraft:wither 3 0 true

# Small impact particle at the boss position
particle minecraft:sweep_attack ~ ~1 ~ 0.5 0.6 0.5 0.05 3 normal
