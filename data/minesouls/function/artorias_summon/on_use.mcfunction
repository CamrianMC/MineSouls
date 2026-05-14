# Reward function for minesouls:artorias_summon/consumed advancement.
# Runs as the player who just consumed the Crest of Artorias.
#
# Execution order:
#   1. Revoke the advancement so it can fire again on the next use.
#   2. If NOT in the End, do nothing (item was already consumed; just return).
#   3. If in the End: announce to nearby players, play a sound, show "5",
#      and start the 5-second (100 tick) summon countdown.

# Allow the advancement to trigger again on the next use
advancement revoke @s only minesouls:artorias_summon/consumed

# Guard: the Crest only works in the End
execute unless predicate minesouls:in_end run tellraw @s {"text":"The crest shows no reaction...","color":"dark_purple","italic":true}
execute unless predicate minesouls:in_end run return 0

# === Summon sequence initialised ===

# Announce to all players within 20 blocks
execute at @s run tellraw @a[distance=..20] {"text":"A dark foreboding feeling takes hold...","color":"dark_purple","bold":false,"italic":true}

# Play an ominous sound at the player's location for nearby players
execute at @s run playsound minecraft:block.portal.trigger player @a[distance=..20] ~ ~ ~ 1 0.5

# Show the first countdown number ("5") as a title to nearby players
execute at @s run title @a[distance=..20] times 2 18 2
execute at @s run title @a[distance=..20] title {"text":"5","color":"dark_red","bold":true}

# Start the 5-second (100 tick) countdown
scoreboard players set @s ms.arta_summon_timer 100
