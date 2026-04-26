# Teleport the player into the abyss at their current coordinates
execute as @s at @s in minesouls:the_abyss run tp @s ~ ~ ~

# Clear 3x3x3 around player (from feet Y to head Y+2) in the abyss
scoreboard players set @s ms.abyss_init 1