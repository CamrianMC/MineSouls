# Macro function – clear exactly $(excess) physik flasks from the player.
# Called by check_limit.mcfunction to remove all extra flasks in one operation.
# Required storage key: minesouls:physik_flask temp.excess (integer >= 1)

$clear @s minecraft:potion[minecraft:custom_data~{minesouls:{physik_flask:true}}] $(excess)
