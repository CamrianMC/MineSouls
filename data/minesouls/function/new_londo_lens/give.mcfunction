# Give the executing player an Eye of New Londo compass.
# Starts uncalibrated — the compass self-calibrates on first right-click via on_use.mcfunction.

# Guard: skip if player already carries one
execute if entity @s[nbt={Inventory:[{components:{"minecraft:custom_data":{minesouls:{new_londo_lens:true}}}}]}] run return 0

give @s minecraft:compass[minecraft:custom_name={"text":"Eye of New Londo","italic":false,"color":"dark_aqua"},minecraft:lore=[{"text":"Seeks the flooded ruins of New Londo.","italic":true,"color":"dark_gray"},{"text":"Right-click to calibrate.","italic":true,"color":"dark_red"}],minecraft:custom_data={minesouls:{new_londo_lens:true}},minecraft:food={nutrition:0,saturation:0.0,can_always_eat:true},minecraft:consumable={consume_seconds:0.05f,animation:"none",sound:"minecraft:item.lodestone_compass.lock",has_consume_particles:false},minecraft:max_stack_size=1] 1
