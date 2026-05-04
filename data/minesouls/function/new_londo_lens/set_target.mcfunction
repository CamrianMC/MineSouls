# DEPRECATED — dynamic location is now handled via the exploration_map trick in on_use.mcfunction.
# This file is kept as a stub in case manual override is needed.
# To manually set a target: run the commands below while standing at the desired location.

# execute store result storage minesouls:new_londo_lens target.x int 1 run data get entity @s Pos[0]
# execute store result storage minesouls:new_londo_lens target.y int 1 run data get entity @s Pos[1]
# execute store result storage minesouls:new_londo_lens target.z int 1 run data get entity @s Pos[2]
# data modify storage minesouls:new_londo_lens target.dim set value "minesouls:the_abyss"
