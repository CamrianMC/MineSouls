# Beast Mastery – Summon a tamed wolf for the Ranger.
# Runs as the Ranger, at the Ranger's position.

# Summon wolf near the player
summon minecraft:wolf ~ ~ ~ {Tags:["ms_bm_new_wolf","ms_bm_wolf"]}

# Tame the wolf to this player by copying the player's UUID to the wolf's Owner field
data modify entity @e[tag=ms_bm_new_wolf,limit=1] Owner set from entity @s UUID

# Mark the wolf as tamed (required for Owner to take effect)
data modify entity @e[tag=ms_bm_new_wolf,limit=1] variant set value "minecraft:ashen"

# Set collar color to cyan (6) to match Ranger theme
data modify entity @e[tag=ms_bm_new_wolf,limit=1] CollarColor set value 9

# Remove the temp summon tag
tag @e[tag=ms_bm_new_wolf] remove ms_bm_new_wolf

# Feedback
playsound minecraft:entity.wolf.howl player @s ~ ~ ~ 1 1
tellraw @s [{"text":"A loyal wolf joins your side!","color":"dark_aqua"}]
