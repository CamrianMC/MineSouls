# Acheron Wither Actions – Per-entity logic for the Acheron wither.
# Runs as the acheron wither, at the wither's position.
# Fires a wither skull at the nearest hostile every 10 ticks and leashes back to the summoner.

# --- Fire timer: increment and fire every 10 ticks ---
scoreboard players add @s ms.acheron_fire 1

# Fire a wither skull at the nearest hostile within 50 blocks
execute if score @s ms.acheron_fire matches 10.. if entity @e[type=#minesouls:hostile,distance=..50,limit=1] run function minesouls:perk/mage/t5/acheron_wither_fire

# Reset timer when it reaches 10 (even if no target, to prevent accumulation)
execute if score @s ms.acheron_fire matches 10.. run scoreboard players set @s ms.acheron_fire 0

# --- Leash: smoothly move toward summoner if farther than 50 blocks ---
execute if entity @a[tag=ms_acheron_anchor,distance=50..,limit=1] facing entity @a[tag=ms_acheron_anchor,sort=nearest,limit=1] eyes run tp @s ^ ^ ^5