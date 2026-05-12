# Warrior Tier 1 perk tick – runs once per tick for every Warrior with a T1 perk.
# Routes to the appropriate perk logic based on ms.t1_perk value.

# Perk 1: Charge – speed boost while looking at an enemy
execute if score @s ms.t1_perk matches 1 run function minesouls:perk/warrior/t1/charge

# Perk 2: Turtle Shell – damage reduction while blocking with a shield. This triggers on advancements so no need to tick it here.
# Clear the perk-resistance tag once the resistance effect has expired so the next blocking session starts clean.
execute if score @s ms.t1_perk matches 2 if entity @s[tag=ms_turtle_res] unless entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] run tag @s remove ms_turtle_res
