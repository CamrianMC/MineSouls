# Parry – Warrior Tier 3 Perk 3
# Blocking just before an enemy melee attack (10 tick window) stuns the enemy for 5 seconds.
# Tracks shield-raise timing and shield damage blocked stat.

# Initialize blocked-damage tracker if not yet set
scoreboard players add @s ms.parry_prev 0

# --- Reset when not blocking ---
execute unless predicate minesouls:blocking_with_shield run tag @s remove ms_parry_blocking
execute unless predicate minesouls:blocking_with_shield run scoreboard players set @s ms.parry_timer 0

# --- Detect blocking start (first frame of shield raise) ---
# Set to 11 because the decrement below fires on the same tick, yielding a 10-tick active window
execute if predicate minesouls:blocking_with_shield unless entity @s[tag=ms_parry_blocking] run scoreboard players set @s ms.parry_timer 11
execute if predicate minesouls:blocking_with_shield unless entity @s[tag=ms_parry_blocking] run tag @s add ms_parry_blocking

# --- Decrement parry window timer ---
execute if entity @s[tag=ms_parry_blocking] if score @s ms.parry_timer matches 1.. run scoreboard players remove @s ms.parry_timer 1

# --- Check if shield blocked damage this tick while parry window is active ---
execute if score @s ms.parry_blocked > @s ms.parry_prev if score @s ms.parry_timer matches 1.. run function minesouls:perk/warrior/t3/parry_trigger

# --- Update blocked-damage tracker ---
scoreboard players operation @s ms.parry_prev = @s ms.parry_blocked
