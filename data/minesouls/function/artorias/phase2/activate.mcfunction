# Knight Artorias – Phase 2 Activate
# Called once at the end of the transition animation (timer >= 60 in state 12).
# Applies all phase 2 changes and returns the boss to idle.
# Runs as the base entity at its position.

# Mark boss as phase 2
scoreboard players set @s ms.arta_phase 2

# Return to idle state with a shortened cooldown so first attack arrives quickly
scoreboard players set @s ms.arta_state 0
scoreboard players set @s ms.arta_timer 0
scoreboard players set @s ms.arta_attack_cd 40

# Initialise aura timer for phase 2 proximity damage
scoreboard players set @s ms.arta_aura_timer 20

# Update bossbar to reflect Abyss-empowered state
bossbar set minesouls:artorias color purple

# Dramatic entry effects
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 1 3 normal
particle minecraft:soul_fire_flame ~ ~1 ~ 3.0 3.0 3.0 0.1 80 normal
particle minecraft:sculk_soul ~ ~1 ~ 2.5 2.5 2.5 0.06 50 normal
playsound minecraft:entity.warden.roar hostile @a[distance=..128] ~ ~ ~ 1 0.5
