# Cheat Death – Rogue Tier 5 Perk 1 (tick)
# Manages death_protection on the offhand so fatal hits are caught by the
# entity_hurt_player advancement reward (cheat_death_hit.mcfunction).
# While on cooldown, death_protection is removed and the player can die normally.

# If player moved the protected item out of offhand (found in inventory/hotbar), just clean up tag.
# Do NOT restore here — let the hit function handle death_protection consumption.
execute if entity @s[tag=ms_cd_protected] unless items entity @s weapon.offhand * if items entity @s inventory.* *[minecraft:custom_data~{ms_cd_dp:1b}] run tag @s remove ms_cd_protected
execute if entity @s[tag=ms_cd_protected] unless items entity @s weapon.offhand * if items entity @s hotbar.* *[minecraft:custom_data~{ms_cd_dp:1b}] run tag @s remove ms_cd_protected

# Off cooldown: ensure death_protection is active on offhand
execute if score @s ms.cd_cd matches 0 run function minesouls:perk/rogue/t5/cd_protect

# On cooldown: remove death_protection and decrement
execute if score @s ms.cd_cd matches 1.. run function minesouls:perk/rogue/t5/cd_unprotect
execute if score @s ms.cd_cd matches 1.. run scoreboard players remove @s ms.cd_cd 1

execute if score @s ms.cd_cd matches 2 run playsound block.amethyst_block.chime player @s ~ ~ ~ 10 0.5
