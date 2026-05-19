# Macro function – restore the executing player's Estus Flask ($(uses) uses remaining) to the hotbar slot it was used from.
# Call via: function minesouls:estus_flask/give_macro with storage minesouls:estus_flask flask_data
# Required storage keys: flask_data.uses (integer 1-10), flask_data.slot (integer 0-8)

$item replace entity @s hotbar.$(slot) with minecraft:honey_bottle[minecraft:custom_name={"text":"Estus Flask","italic":false,"color":"gold"},minecraft:lore=[{"text":"An undead favorite. Restores HP","italic":true,"color":"dark_purple"},{"text":"Uses: $(uses)/10","italic":false,"color":"dark_aqua"}],minecraft:custom_data={minesouls:{estus_flask:true,estus_uses:$(uses)}},minecraft:food={nutrition:2,saturation:0.0,can_always_eat:true},!minecraft:use_remainder,minecraft:item_model="minesouls:estus_flask"] 1
