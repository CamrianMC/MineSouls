# Wave Hit – applies massive damage when the dark-magic wave reaches a player.
# Runs as the orphaned marker at the impact point.

# Deal 40 magic damage (20 hearts) to all players within 3 blocks of the impact point.
# Magic damage type bypasses armour, befitting a dark-magic attack.
execute as @a[distance=..3] run damage @s 40 minecraft:magic

# Dramatic dark-magic impact visual
particle minecraft:dragon_breath ~ ~ ~ 2.0 2.0 2.0 0.05 80 normal
particle minecraft:soul_fire_flame ~ ~ ~ 1.5 1.5 1.5 0.1 40 normal
particle minecraft:squid_ink ~ ~ ~ 1.0 1.0 1.0 0.05 20 normal

# Impact audio
playsound minecraft:entity.elder_guardian.curse hostile @a[distance=..64] ~ ~ ~ 1 0.5
