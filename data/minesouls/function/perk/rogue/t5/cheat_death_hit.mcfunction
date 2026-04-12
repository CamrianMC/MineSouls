# Cheat Death – Fatal Damage Prevention
# Fired by the entity_hurt_player advancement when the player takes damage.
# Death_protection on the offhand prevents fatal hits from killing the player.
# If death_protection fired (item consumed), we restore the offhand, set health
# to 1 HP, and start the 2-minute cooldown.

# Revoke advancement so it can re-trigger on the next hit
advancement revoke @s only minesouls:perk/rogue/t5/cheat_death

# If on cooldown, death_protection shouldn't be active — just exit
execute if score @s ms.cd_cd matches 1.. run return 0

# Check if death_protection fired by seeing if our knowledge book was consumed
execute if items entity @s weapon.offhand minecraft:knowledge_book[minecraft:custom_data~{ms_cd:1b}] run return 0

# Check if death_protection fired by seeing if a protected real item was consumed
execute if entity @s[tag=ms_cd_protected] if items entity @s weapon.offhand * run return 0

# --- Death_protection fired: the player survived a fatal hit ---

# Restore consumed offhand item if it was a real protected item
execute unless items entity @s weapon.offhand * if entity @s[tag=ms_cd_protected] run function minesouls:perk/rogue/t5/cd_restore_item

# Start 1-minute cooldown (1200 ticks)
scoreboard players set @s ms.cd_cd 1200