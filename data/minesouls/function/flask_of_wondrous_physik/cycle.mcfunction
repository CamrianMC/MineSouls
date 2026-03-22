# Reward function for minesouls:flask_of_wondrous_physik/cycling advancement.
# Runs as a player who is sneaking while satisfying the resting_at_bonfire predicate.
# Advances ms.physik_type by one step (wrapping 5 → 0) at most once per second.

# Revoke immediately so the location trigger can re-fire on the next check
advancement revoke @s only minesouls:flask_of_wondrous_physik/cycling

# Enforce a 1-second (20-tick) cooldown between cycles
execute if score @s ms.physik_cycle_timer matches 1.. run return 0

# Advance to the next flask type, wrapping at 6
scoreboard players add @s ms.physik_type 1
execute if score @s ms.physik_type matches 6.. run scoreboard players set @s ms.physik_type 0

# If the player currently holds a physik flask, swap it out to show the new type
execute if items entity @s container.* minecraft:potion[minecraft:custom_data~{minesouls:{physik_flask:true}}] run function minesouls:flask_of_wondrous_physik/update_item

# Notify the player of their new selection
execute if score @s ms.physik_type matches 0 run tellraw @s {"text":"Physik: Flask of Healing","color":"light_purple","italic":false}
execute if score @s ms.physik_type matches 1 run tellraw @s {"text":"Physik: Flask of Strength","color":"light_purple","italic":false}
execute if score @s ms.physik_type matches 2 run tellraw @s {"text":"Physik: Flask of Mobility","color":"light_purple","italic":false}
execute if score @s ms.physik_type matches 3 run tellraw @s {"text":"Physik: Flask of Defense","color":"light_purple","italic":false}
execute if score @s ms.physik_type matches 4 run tellraw @s {"text":"Physik: Flask of the Elements","color":"light_purple","italic":false}
execute if score @s ms.physik_type matches 5 run tellraw @s {"text":"Physik: Flask of Stealth","color":"light_purple","italic":false}

# Set cooldown to 20 ticks (1 second) before the next cycle
scoreboard players set @s ms.physik_cycle_timer 20
