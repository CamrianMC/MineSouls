# Give the executing player a Darksign.
# Silently refused if the player already carries one (limit: 1 per player).

# Guard: refuse if the player already carries a Darksign
execute if items entity @s container.* minecraft:paper[minecraft:custom_data={minesouls:{darksign:true}}] run return 0

give @s minecraft:paper[minecraft:custom_name={"text":"Darksign","italic":false,"color":"dark_red"},minecraft:lore=[{"text":"The mark of an Undead. Returns you home at the cost of your souls.","italic":true,"color":"dark_gray"},{"text":"Activate twice to return to worldspawn.","italic":true,"color":"dark_gray"}],minecraft:custom_data={minesouls:{darksign:true}},minecraft:food={nutrition:0,saturation:0.0,can_always_eat:true},minecraft:consumable={consume_seconds:0.05f,animation:"none",sound:"minecraft:block.amethyst_block.chime"},minecraft:max_stack_size=1,minecraft:enchantment_glint_override=true,minecraft:item_model="minesouls:darksign"] 1
