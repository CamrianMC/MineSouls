# Macro function – restore a depleted (empty) Estus Flask to the hotbar slot it was used from.
# Call via: function minesouls:estus_flask/give_depleted with storage minesouls:estus_flask flask_data
# Required storage keys: flask_data.slot (integer 0-8), flask_data.uses (present but unused; shared storage with give_macro)

$item replace entity @s hotbar.$(slot) with minecraft:glass_bottle[minecraft:custom_name={"text":"Empty Estus Flask","italic":false,"color":"gray"},minecraft:lore=[{"text":"An undead favorite. Restores HP","italic":true,"color":"dark_purple"},{"text":"Uses: 0/10","italic":false,"color":"dark_red"}],minecraft:custom_data={minesouls:{estus_empty:true}},minecraft:item_model="minesouls:estus_flask_empty"] 1
