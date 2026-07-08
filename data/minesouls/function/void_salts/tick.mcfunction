# Void Salts: per-player tick for ongoing effects (chicken rain + monster noises)
# Called from the main tick.mcfunction for players with active void salts timers

# ── Chicken Rain (ms.void_salts_chicken) ────────────────────────────────────
# Spawn a chicken 10-15 blocks above the player every 4 ticks (5 per second)
execute if score @s ms.void_salts_chicken matches 1.. run scoreboard players remove @s ms.void_salts_chicken 1
execute if score @s ms.void_salts_chicken matches 1.. at @s run summon minecraft:chicken ~ ~12 ~ {Motion:[0.0,-0.5,0.0]}

# ── Monster Noises (ms.void_salts_noise) ─────────────────────────────────────
# Play random spooky sounds at intervals throughout 30 seconds
execute if score @s ms.void_salts_noise matches 1.. run scoreboard players remove @s ms.void_salts_noise 1

# Play sounds at specific intervals throughout the 30-second duration
execute if score @s ms.void_salts_noise matches 560 at @s run playsound minecraft:entity.creeper.primed hostile @s ~ ~ ~ 0.8 0.5
execute if score @s ms.void_salts_noise matches 520 at @s run playsound minecraft:ambient.cave player @s ~ ~ ~ 1 0.8
execute if score @s ms.void_salts_noise matches 480 at @s run playsound minecraft:entity.zombie.ambient hostile @s ~ ~ ~ 0.9 0.7
execute if score @s ms.void_salts_noise matches 440 at @s run playsound minecraft:entity.skeleton.ambient hostile @s ~ ~ ~ 0.8 0.6
execute if score @s ms.void_salts_noise matches 400 at @s run playsound minecraft:entity.creeper.primed hostile @s ~ ~ ~ 0.7 0.8
execute if score @s ms.void_salts_noise matches 360 at @s run playsound minecraft:entity.ghast.scream hostile @s ~ ~ ~ 0.6 0.5
execute if score @s ms.void_salts_noise matches 320 at @s run playsound minecraft:ambient.cave player @s ~ ~ ~ 1 1.2
execute if score @s ms.void_salts_noise matches 280 at @s run playsound minecraft:entity.enderman.scream hostile @s ~ ~ ~ 0.7 0.7
execute if score @s ms.void_salts_noise matches 240 at @s run playsound minecraft:entity.creeper.primed hostile @s ~ ~ ~ 0.9 0.6
execute if score @s ms.void_salts_noise matches 200 at @s run playsound minecraft:entity.wither.ambient hostile @s ~ ~ ~ 0.5 0.8
execute if score @s ms.void_salts_noise matches 160 at @s run playsound minecraft:entity.zombie.ambient hostile @s ~ ~ ~ 1 0.5
execute if score @s ms.void_salts_noise matches 120 at @s run playsound minecraft:entity.creeper.primed hostile @s ~ ~ ~ 1 0.7
execute if score @s ms.void_salts_noise matches 80 at @s run playsound minecraft:ambient.cave player @s ~ ~ ~ 1 0.6
execute if score @s ms.void_salts_noise matches 40 at @s run playsound minecraft:entity.creeper.primed hostile @s ~ ~ ~ 1 1
