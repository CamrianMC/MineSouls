# Phase 2 Trigger – enrages Manus when health drops to 600 (Phase 1 → Phase 2).
# Runs as Manus at Manus.

# Mark Manus as Phase 2
scoreboard players set @s ms.manus_phase 2

# Greatly increase movement speed (Phase 2: 0.45, Phase 1 was 0.15, standard Warden is 0.3)
attribute @s minecraft:movement_speed base set 0.45

# Announce the enrage to all players in the Abyss
#tellraw @a [{"text":"Manus ","color":"dark_purple","bold":true},{"text":"ENRAGES","color":"dark_red","bold":true},{"text":"!","color":"dark_purple","bold":true}]

# Dramatic phase-transition audio and visual
playsound minecraft:entity.warden.roar hostile @a[distance=..128] ~ ~ ~ 1 0.7
playsound minecraft:entity.warden.roar hostile @a[distance=..128] ~ ~ ~ 1 0.5
particle minecraft:soul_fire_flame ~ ~1 ~ 2.5 2.5 2.5 0.1 120 normal
particle minecraft:dragon_breath ~ ~1 ~ 2.0 2.0 2.0 0.05 80 normal
particle minecraft:explosion ~ ~1 ~ 1.5 1.5 1.5 0.2 30 normal

# Immediately summon the first wave of Darkwraiths on phase entry
function minesouls:manus/summon_darkwraiths

