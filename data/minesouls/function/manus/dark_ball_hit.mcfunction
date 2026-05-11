# Dark Ball Hit – releases the ground shockwave when a dark energy ball reaches
# the arena floor (i.e. its descent timer expires).
# Runs as the spent dark ball marker at the impact position.

# Deal 20 magic damage (10 hearts) to all players on the ground within 20 blocks.
# OnGround:1b ensures only players who are standing are hit; jumping dodges the wave.
execute as @a[distance=..20] if data entity @s {OnGround:1b} run damage @s 20 minecraft:magic

# Massive shockwave visuals – radial burst of dark energy
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 3 normal
particle minecraft:dragon_breath ~ ~ ~ 5.0 0.4 5.0 0.05 250 normal
particle minecraft:soul_fire_flame ~ ~ ~ 4.0 0.3 4.0 0.08 120 normal
particle minecraft:squid_ink ~ ~ ~ 3.0 0.2 3.0 0.04 60 normal
particle minecraft:reverse_portal ~ ~ ~ 4.5 0.2 4.5 0.06 100 normal

# Impact audio
playsound minecraft:entity.generic.explode hostile @a[distance=..80] ~ ~ ~ 1.2 0.6
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..80] ~ ~ ~ 1.0 0.4
