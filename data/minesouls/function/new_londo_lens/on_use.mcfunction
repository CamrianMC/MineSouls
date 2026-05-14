# Reward function for minesouls:new_londo_lens/used advancement.
# Runs as the player who right-clicked the Eye of New Londo.

# Reset the advancement so it can fire again on the next use
advancement revoke @s only minesouls:new_londo_lens/used

# --- Dynamic locate via armor stand + exploration map trick ---
# 1. Summon a marker armor stand holding a map (mainhand) and the compass (offhand).
#    The compass offhand starts with lodestone_tracker pointing at [0,0,0] — will be updated below.
#    The armor stand is summoned in the Abyss (where New Londo Ruins generates) at the player's XZ.
execute in minesouls:the_abyss run summon minecraft:armor_stand ~ 128 ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["ms_nll_locator"],equipment:{mainhand:{id:"minecraft:map",count:1},offhand:{id:"minecraft:compass",count:1,components:{"minecraft:custom_name":{"text":"Eye of New Londo","italic":false,"color":"dark_aqua"},"minecraft:lore":[{"text":"Seeks the flooded ruins of New Londo.","italic":true,"color":"dark_gray"}],"minecraft:custom_data":{minesouls:{new_londo_lens:true}},"minecraft:food":{"nutrition":0,"saturation":0.0,"can_always_eat":true},"minecraft:consumable":{"consume_seconds":0.05,"animation":"none","sound":"minecraft:item.lodestone_compass.lock","has_consume_particles":false},"minecraft:max_stack_size":1,"minecraft:lodestone_tracker":{target:{dimension:"minesouls:the_abyss",pos:[I;0,64,0]},tracked:false}}}}}

# 2. Apply exploration_map modifier to the map — this populates map_decorations with the ruins x/z
execute as @e[type=minecraft:armor_stand,tag=ms_nll_locator,limit=1] run item modify entity @s weapon.mainhand minesouls:locate_new_londo_ruins

# 3. Copy x and z from map_decorations into the compass lodestone_tracker pos
execute as @e[type=minecraft:armor_stand,tag=ms_nll_locator,limit=1] run data modify entity @s equipment.offhand.components."minecraft:lodestone_tracker".target.pos[0] set from entity @s equipment.mainhand.components."minecraft:map_decorations".+.x
execute as @e[type=minecraft:armor_stand,tag=ms_nll_locator,limit=1] run data modify entity @s equipment.offhand.components."minecraft:lodestone_tracker".target.pos[2] set from entity @s equipment.mainhand.components."minecraft:map_decorations".+.z

# 4. Transfer the calibrated compass to the player
item replace entity @s weapon.mainhand from entity @e[type=minecraft:armor_stand,tag=ms_nll_locator,limit=1] weapon.offhand

# 5. Clean up the armor stand
kill @e[type=minecraft:armor_stand,tag=ms_nll_locator]

# Trigger the placeholder use effect (fill in minesouls:new_londo_lens/use)
function minesouls:new_londo_lens/use
