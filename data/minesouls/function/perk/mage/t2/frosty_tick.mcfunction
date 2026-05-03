# Frosty Tick – Per-entity tick for the frosty snow golem turret.
# Fires a snowball at the nearest hostile mob every 20 ticks (1 second).
# Runs as the frosty snow golem, at the golem's position.

# Increment fire rate timer
scoreboard players add @s ms.frosty_fire 1

# Fire every 20 ticks (1 second) if there's a target
execute if score @s ms.frosty_fire matches 20.. if entity @e[type=#minesouls:hostile,distance=..10] run function minesouls:perk/mage/t2/frosty_fire

# Reset timer when it reaches 20 (even if no target, to prevent accumulation)
execute if score @s ms.frosty_fire matches 20.. run scoreboard players set @s ms.frosty_fire 0

# Entity-side lifetime: decrement and self-destruct when the timer reaches 0
# (ensures expiry even if the owner player is dead or out of the loaded area)
scoreboard players remove @s ms.lifetime 1
execute if score @s ms.lifetime matches ..0 run function minesouls:perk/mage/t2/frosty_die
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.frosty_active=1}] ms.frosty_active 0
execute if score @s ms.lifetime matches ..0 run scoreboard players set @a[scores={ms.frosty_active=1}] ms.frosty_timer 0
