# Replace the Flask of Wondrous Physik in the player's inventory with a fresh one
# reflecting the player's current ms.physik_type selection.
# Called by cycle.mcfunction after the type has been incremented.

# Remove the old flask
clear @s minecraft:potion[minecraft:custom_data~{minesouls:{physik_flask:true}}]

# Give the updated flask (guard in give.mcfunction will not block since we just cleared)
function minesouls:flask_of_wondrous_physik/give
