# Druid Wolf Tick – Per-entity tick for each summoned druid wolf.
# Runs as the wolf, at the wolf's position.
# Entity-side lifetime: decrement and self-destruct when the timer reaches 0
# (ensures expiry even if the owner player is dead or out of the loaded area)
scoreboard players remove @s ms.lifetime 1
execute if score @s ms.lifetime matches ..0 run function minesouls:perk/mage/t3/druid_die
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.druid_active=1}] ms.druid_active 0
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.druid_active=1}] ms.druid_timer 0
