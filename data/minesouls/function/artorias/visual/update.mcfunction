# Knight Artorias – Visual Armor Stand Sync
# Teleports the armor stand to the base entity's exact position and rotation.
# Uses scoreboard ID matching to support multiple potential instances.
# Runs as the base entity (vindicator) at its position.

# Store this entity's ID in a temp fake-player for cross-entity comparison
scoreboard players operation #arta_link ms.arta_temp = @s ms.arta_id

# Teleport every armor stand whose ID matches ours to our position + rotation
execute as @e[type=armor_stand,tag=ms_artorias_stand] if score @s ms.arta_id = #arta_link ms.arta_temp rotated as @e[type=vindicator,tag=ms_artorias,scores={ms.arta_id=0..}] run teleport @s ~ ~ ~ ~ ~

# Simpler single-instance fallback (also handles the common one-boss scenario cleanly)
execute rotated as @s run teleport @e[type=armor_stand,tag=ms_artorias_stand,limit=1] ~ ~ ~ ~ ~
