# Knight Artorias – Phase 2 Transition Animation (state 12)
# Per-tick handler for the Abyss empowerment sequence.
# Boss is frozen in the spreading-arms pose while particles and sound play.
# Runs as the base entity at its position.

# Apply the transition pose every tick
function minesouls:artorias/visual/pose_phase_transition

# Tick 1: stop movement, announce transition, roar sound
execute if score @s ms.arta_timer matches 1 run tellraw @a [{"text":"Knight Artorias ","color":"dark_blue","bold":true},{"text":"is consumed by the Abyss!","color":"dark_purple","bold":true}]
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.warden.roar hostile @a[distance=..128] ~ ~ ~ 1 0.6
execute if score @s ms.arta_timer matches 1 run playsound minecraft:entity.warden.death hostile @a[distance=..128] ~ ~ ~ 0.6 0.4

# Continuous particle burst throughout transition (Abyss corruption)
particle minecraft:soul_fire_flame ~ ~1 ~ 1.5 1.8 1.5 0.1 12 normal
particle minecraft:sculk_soul ~ ~1 ~ 1.2 1.5 1.2 0.06 8 normal
particle minecraft:squid_ink ~ ~1 ~ 0.8 1.2 0.8 0.04 6 normal
particle minecraft:dragon_breath ~ ~1 ~ 1.8 2.0 1.8 0.05 10 normal

# Extra burst at the midpoint of the transition
execute if score @s ms.arta_timer matches 30 run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 3 normal
execute if score @s ms.arta_timer matches 30 run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..128] ~ ~ ~ 1 0.4

# After 60 ticks: activate phase 2 effects and return to idle
execute if score @s ms.arta_timer matches 60.. run function minesouls:artorias/phase2/activate
