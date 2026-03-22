# Macro function – clear exactly $(excess) active Estus Flasks from the player.
# Called by check_limit.mcfunction to remove all extra flasks in one operation.
# Required storage key: minesouls:estus_flask temp.excess (integer >= 1)

$clear @s minecraft:honey_bottle[minecraft:custom_data~{minesouls:{estus_flask:true}}] $(excess)
