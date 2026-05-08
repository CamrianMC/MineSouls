# Knight Artorias – Visual Armor Stand Sync
# Teleports the armor stand to the base entity's exact position and rotation.
# Uses scoreboard ID matching to correctly pair each stand with its own base entity.
# Runs as the base entity (vindicator) at its position.

# Store this entity's ID in a temp fake-player for cross-entity comparison
scoreboard players operation #arta_link ms.arta_temp = @s ms.arta_id

# Teleport every armor stand whose ID matches ours to OUR position with OUR rotation.
# The outer `as @s rotated as @s` context provides the vindicator's position/rotation;
# the inner `as @e[...]` switches entity but inherits that position/rotation for teleport.
execute rotated as @s as @e[type=armor_stand,tag=ms_artorias_stand] if score @s ms.arta_id = #arta_link ms.arta_temp run teleport @s ~ ~ ~ ~ ~
