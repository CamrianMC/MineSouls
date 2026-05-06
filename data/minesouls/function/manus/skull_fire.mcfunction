# Skull Fire – fires 4 wither skulls simultaneously in alternating direction patterns.
# Alternates between cardinal (0/90/180/270°) and diagonal (45/135/225/315°) salvos.
# Runs as Manus at Manus.

# Reset the skull cooldown (30 ticks = 1.5 s between salvos)
scoreboard players set @s ms.manus_skull_timer 30

# Snapshot current pattern into a temp fake-player, then advance for next salvo
scoreboard players operation #sk_pat ms.manus_temp = @s ms.manus_skull_pattern
scoreboard players add @s ms.manus_skull_pattern 1
execute if score @s ms.manus_skull_pattern matches 2.. run scoreboard players set @s ms.manus_skull_pattern 0

# --- Pattern A: cardinal directions (south=0, west=90, north=180, east=270) ---
execute if score #sk_pat ms.manus_temp matches 0 anchored eyes rotated 0 0 run function minesouls:manus/skull_fire_aimed
execute if score #sk_pat ms.manus_temp matches 0 anchored eyes rotated 90 0 run function minesouls:manus/skull_fire_aimed
execute if score #sk_pat ms.manus_temp matches 0 anchored eyes rotated 180 0 run function minesouls:manus/skull_fire_aimed
execute if score #sk_pat ms.manus_temp matches 0 anchored eyes rotated 270 0 run function minesouls:manus/skull_fire_aimed

# --- Pattern B: diagonal directions (SW=45, NW=135, NE=225, SE=315) ---
execute if score #sk_pat ms.manus_temp matches 1 anchored eyes rotated 45 0 run function minesouls:manus/skull_fire_aimed
execute if score #sk_pat ms.manus_temp matches 1 anchored eyes rotated 135 0 run function minesouls:manus/skull_fire_aimed
execute if score #sk_pat ms.manus_temp matches 1 anchored eyes rotated 225 0 run function minesouls:manus/skull_fire_aimed
execute if score #sk_pat ms.manus_temp matches 1 anchored eyes rotated 315 0 run function minesouls:manus/skull_fire_aimed
