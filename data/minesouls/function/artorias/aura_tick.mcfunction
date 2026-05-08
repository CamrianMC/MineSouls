# Knight Artorias – Phase 2 Proximity Aura Tick
# Called every tick while in phase 2. Decrements an aura cooldown timer and,
# when it expires, deals small Abyss damage to any player standing very close.
# Runs as the base entity at its position.

# Decrement aura timer
scoreboard players remove @s ms.arta_aura_timer 1

# When timer expires: fire aura and reset
execute if score @s ms.arta_aura_timer matches ..0 run function minesouls:artorias/aura_fire
