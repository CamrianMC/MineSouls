# Teleport the player into the abyss at their current coordinates
execute as @s at @s in minesouls:the_abyss run tp @s ~ 90 ~

# Clear 3x3x3 around player (from feet Y to head Y+2) in the abyss
scoreboard players set @s ms.abyss_init 1

# Grant "Nyctophobia" achievement on first entry into the Abyss
advancement grant @s only minesouls:achievement/nyctophobia