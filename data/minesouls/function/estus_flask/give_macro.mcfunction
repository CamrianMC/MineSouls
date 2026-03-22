# Macro function – give the executing player an Estus Flask with $(uses) uses remaining.
# Call via: function minesouls:estus_flask/give_macro with storage minesouls:estus_flask flask_data
# Required storage key: flask_data.uses (integer 1-10)

$give @s minecraft:honey_bottle[minecraft:custom_name={"text":"Estus Flask","italic":false,"color":"gold"},minecraft:lore=[{"text":"An undead favorite. Restores HP","italic":true,"color":"dark_purple"},{"text":"Uses: $(uses)/10","italic":false,"color":"dark_aqua"}],minecraft:custom_data={minesouls:{estus_flask:true,estus_uses:$(uses)}},minecraft:food={nutrition:2,saturation:0.0,can_always_eat:true},!minecraft:use_remainder,minecraft:item_model="minesouls:estus_flask"] 1
