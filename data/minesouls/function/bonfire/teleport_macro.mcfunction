# Macro function – teleport the executing player to the stored bonfire coordinates.
# Call via: function minesouls:bonfire/teleport_macro with storage minesouls:bonfire tp
# Required storage keys: tp.x, tp.y, tp.z (integers)

$tp @s $(x) $(y) $(z)
