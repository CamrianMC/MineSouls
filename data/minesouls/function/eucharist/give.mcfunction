# Give the executing player a Eucharist.
# Run as the player who should receive the item.

give @s minecraft:cookie[minecraft:custom_name={"text":"Eucharist","italic":false,"color":"white"},minecraft:lore=[{"text":"The body and blood of Christ.","italic":true,"color":"gray"},{"text":"Do NOT consume unless without sin.","italic":false,"color":"yellow"}],minecraft:custom_data={minesouls:{eucharist:true}},minecraft:food={nutrition:20,saturation:20.0,can_always_eat:true},!minecraft:use_remainder,minecraft:item_model="minesouls:eucharist"] 1
