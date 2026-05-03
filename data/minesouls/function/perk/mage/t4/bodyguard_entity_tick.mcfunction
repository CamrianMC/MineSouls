# Bodyguard Entity Tick – Per-entity tick for each summoned bodyguard iron golem.
# Runs as the golem, at the golem's position.
# Entity-side lifetime: decrement and self-destruct when the timer reaches 0
# (ensures expiry even if the owner player is dead or out of the loaded area)
scoreboard players remove @s ms.lifetime 1
execute if score @s ms.lifetime matches ..0 run function minesouls:perk/mage/t4/bodyguard_die
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.bodyguard_active=1}] ms.bodyguard_active 0
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.bodyguard_active=1}] ms.bodyguard_timer 0
