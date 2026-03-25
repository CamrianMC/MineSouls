# Cheat Death – Rogue Tier 5 Perk 1
# Fatal damage will instead leave the player at 1 HP. 2 minute cooldown.
# The survival logic is handled by the entity_hurt_player advancement
# (cheat_death_hit.mcfunction) which fires before the death check.
# This tick function only decrements the cooldown.

execute if score @s ms.cd_cd matches 1.. run scoreboard players remove @s ms.cd_cd 1
