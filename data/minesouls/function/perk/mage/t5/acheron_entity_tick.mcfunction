# Acheron Wither Entity Tick – Handles the lifetime countdown independently of the owner player.
# Runs as the wither, at the wither's position.
# Entity-side lifetime: decrement and self-destruct when the timer reaches 0
# (ensures expiry even if the owner player is dead or out of the loaded area)
scoreboard players remove @s ms.lifetime 1
execute if score @s ms.lifetime matches ..0 run function minesouls:perk/mage/t5/acheron_die
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.acheron_active=1}] ms.acheron_active 0
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.acheron_active=1}] ms.acheron_timer 0
