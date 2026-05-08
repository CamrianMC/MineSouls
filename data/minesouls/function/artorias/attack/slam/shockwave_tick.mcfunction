# Knight Artorias – Shockwave Ring Tick
# Called from tick.mcfunction for every active shockwave ring marker.
# Counts down the marker's timer, deals damage on expiry, then kills itself.
# Runs as the marker entity at its position.

# Decrement lifetime
scoreboard players remove @s ms.arta_temp 1

# On expiry: emit particles, deal damage to nearby players, then self-destruct
execute if score @s ms.arta_temp matches ..0 run particle minecraft:sculk_charge_pop ~ ~ ~ 1.5 0.3 1.5 0.05 30 normal
execute if score @s ms.arta_temp matches ..0 run particle minecraft:soul_fire_flame ~ ~ ~ 1.0 0.3 1.0 0.06 15 normal

# Inner ring (ms_arta_shockwave): 3-block damage radius, 15 damage
execute if entity @s[tag=ms_arta_shockwave] if score @s ms.arta_temp matches ..0 run execute as @a[distance=..3] run damage @s 15 minecraft:player_attack

# Outer ring (ms_arta_shockwave_outer): 3-block radius, 8 damage
execute if entity @s[tag=ms_arta_shockwave_outer] if score @s ms.arta_temp matches ..0 run execute as @a[distance=..3] run damage @s 8 minecraft:player_attack

execute if score @s ms.arta_temp matches ..0 run kill @s
