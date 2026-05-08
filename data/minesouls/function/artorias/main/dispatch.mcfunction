# Knight Artorias – State Dispatcher
# Routes execution to exactly one state handler per tick.
# Uses "return run function" so only the first matching branch executes;
# any state transition made inside a handler will not double-trigger the new state.
# Runs as the base entity (vindicator) at its position.

# State 0 – idle / chase + attack selection
execute if score @s ms.arta_state matches 0 run return run function minesouls:artorias/main/state_idle

# States 1-3 – Abyssal Lunge
execute if score @s ms.arta_state matches 1 run return run function minesouls:artorias/attack/lunge/start
execute if score @s ms.arta_state matches 2 run return run function minesouls:artorias/attack/lunge/dash
execute if score @s ms.arta_state matches 3 run return run function minesouls:artorias/attack/lunge/recovery

# States 4-7 – Somersault Slam
execute if score @s ms.arta_state matches 4 run return run function minesouls:artorias/attack/slam/start
execute if score @s ms.arta_state matches 5 run return run function minesouls:artorias/attack/slam/air
execute if score @s ms.arta_state matches 6 run return run function minesouls:artorias/attack/slam/impact
execute if score @s ms.arta_state matches 7 run return run function minesouls:artorias/attack/slam/recovery

# States 8-11 – Abyss Combo
execute if score @s ms.arta_state matches 8 run return run function minesouls:artorias/attack/combo/step1
execute if score @s ms.arta_state matches 9 run return run function minesouls:artorias/attack/combo/step2
execute if score @s ms.arta_state matches 10 run return run function minesouls:artorias/attack/combo/step3
execute if score @s ms.arta_state matches 11 run return run function minesouls:artorias/attack/combo/recovery

# State 12 – Phase 2 transition animation
execute if score @s ms.arta_state matches 12 run return run function minesouls:artorias/phase2/trigger
