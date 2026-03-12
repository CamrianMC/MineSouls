# Give the executing player a full Estus Flask (10 uses).
# Run as the player who should receive the flask.

# Guard: refuse if the player already carries an active Estus Flask
execute if items entity @s container.* minecraft:honey_bottle[minecraft:custom_data~{minesouls:{estus_flask:true}}] run return run function minesouls:estus_flask/give_refused

# Guard: refuse if the player already carries a depleted Estus Flask
execute if items entity @s container.* minecraft:glass_bottle[minecraft:custom_data~{minesouls:{estus_empty:true}}] run return run function minesouls:estus_flask/give_refused

give @s minecraft:honey_bottle[minecraft:custom_name='{"text":"Estus Flask","italic":false,"color":"gold"}',minecraft:lore=['{"text":"An undead favorite. Restores HP","italic":true,"color":"dark_purple"}','{"text":"Uses: 10/10","italic":false,"color":"dark_aqua"}'],minecraft:custom_data={minesouls:{estus_flask:true,estus_uses:10}},minecraft:food={nutrition:0,saturation:0.0},minecraft:item_model:"minesouls:estus_flask"] 1
