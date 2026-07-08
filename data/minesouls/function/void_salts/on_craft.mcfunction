# Reward function for minesouls:void_salts/crafted advancement.
# Runs when a player crafts the Void Salts recipe (paper + blaze powder).
# Replaces the plain bowl output with the actual Void Salts custom item.

# Allow the advancement to trigger again
advancement revoke @s only minesouls:void_salts/crafted

# Remove the plain bowl that was crafted
clear @s minecraft:bowl 1

# Give the proper Void Salts item
function minesouls:void_salts/give
