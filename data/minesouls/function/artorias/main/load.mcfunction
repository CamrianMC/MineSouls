# Knight Artorias – Load function
# Called from load.mcfunction when the datapack initialises.
# Creates all scoreboards, the bossbar, the artorias team, and seed constants.

# State machine scoreboards
scoreboard objectives add ms.arta_state dummy
scoreboard objectives add ms.arta_timer dummy
scoreboard objectives add ms.arta_attack_cd dummy
scoreboard objectives add ms.arta_attack_choice dummy
scoreboard objectives add ms.arta_phase dummy
scoreboard objectives add ms.arta_temp dummy
scoreboard objectives add ms.arta_dist dummy

# Global alive flag (1 while boss is active; 0 on despawn so achievement does not fire)
scoreboard objectives add ms.arta_alive dummy
scoreboard players set #global ms.arta_alive 0

# Entity-linking ID counter (incremented on every spawn to pair base entity ↔ armor stand)
scoreboard objectives add ms.arta_id dummy
scoreboard players set #arta_next_id ms.arta_id 0

# Phase 2 aura cooldown (per boss entity)
scoreboard objectives add ms.arta_aura_timer dummy

# Per-player ambient music timer
scoreboard objectives add ms.arta_music_timer dummy

# Bossbar (hidden until boss spawns)
bossbar add minesouls:artorias {"text":"Knight Artorias","color":"blue","bold":true}
bossbar set minesouls:artorias max 1000
bossbar set minesouls:artorias value 0
bossbar set minesouls:artorias color blue
bossbar set minesouls:artorias visible false

# Team: Artorias cannot friendly-fire itself (prevents weird self-damage loops)
team add artorias
team modify artorias friendlyFire false
