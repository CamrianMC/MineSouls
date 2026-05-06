# Give the executing player a Eucharist.
# Run as the player who should receive the item.

give @s minecraft:cookie[minecraft:custom_name={"text":"Eucharist","italic":false,"color":"white"},minecraft:lore=[{"text":"Bread of the Gods","italic":true,"color":"gray"},{"text":"Restores all hunger, health, and vitality.","italic":false,"color":"yellow"},{"text":"The sinful shall face divine judgment.","italic":false,"color":"dark_red"}],minecraft:custom_data={minesouls:{eucharist:true}},minecraft:food={nutrition:20,saturation:20.0,can_always_eat:true},!minecraft:use_remainder,minecraft:item_model="minesouls:eucharist"] 1
