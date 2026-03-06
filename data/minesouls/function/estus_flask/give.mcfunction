# Give the executing player a full Estus Flask (10 uses).
# Run as the player who should receive the flask.

give @s minecraft:honey_bottle[minecraft:custom_name='{"text":"Estus Flask","italic":false,"color":"gold"}',minecraft:lore=['{"text":"An undead favorite. Restores HP","italic":true,"color":"dark_purple"}','{"text":"Uses: 10/10","italic":false,"color":"dark_aqua"}'],minecraft:custom_data={minesouls:{estus_flask:true,estus_uses:10}},minecraft:food={nutrition:0,saturation:0.0},minecraft:item_model:"minesouls:estus_flask"] 1
