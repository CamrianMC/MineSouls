# Knight Artorias – Abyss Combo: Rupture Tick
# Called from tick.mcfunction for every active rupture marker.
# Counts down 20 ticks then detonates with an Abyss ground-burst.
# Runs as the marker entity at its position.

# Decrement timer
scoreboard players remove @s ms.arta_temp 1

# Warning particles while counting down (every tick)
particle minecraft:sculk_soul ~ ~0.2 ~ 0.3 0.1 0.3 0.05 4 normal
particle minecraft:squid_ink ~ ~0.1 ~ 0.2 0.1 0.2 0.02 3 normal

# Detonate when timer expires
execute if score @s ms.arta_temp matches ..0 run particle minecraft:sculk_charge_pop ~ ~ ~ 1.2 0.5 1.2 0.06 30 normal
execute if score @s ms.arta_temp matches ..0 run particle minecraft:dragon_breath ~ ~ ~ 1.0 0.5 1.0 0.04 20 normal
execute if score @s ms.arta_temp matches ..0 run particle minecraft:soul_fire_flame ~ ~ ~ 1.0 0.5 1.0 0.06 15 normal
execute if score @s ms.arta_temp matches ..0 run playsound minecraft:entity.elder_guardian.curse hostile @a[distance=..64] ~ ~ ~ 0.8 0.6

# Damage players within 3 blocks of the rupture
execute if score @s ms.arta_temp matches ..0 run execute as @a[distance=..3] run damage @s 12 minecraft:magic
execute if score @s ms.arta_temp matches ..0 run execute as @a[distance=..3] run effect give @s minecraft:wither 3 0 true

# Self-destruct after detonation
execute if score @s ms.arta_temp matches ..0 run kill @s
