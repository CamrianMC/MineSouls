# Lightning Tick – global tick for Manus' lightning warning markers.
# Emits bright warning particles for 1.5 seconds (30 ticks), then strikes lightning.
# Called once per game tick from tick.mcfunction.

# --- Step 1: Emit bright warning particles from all live markers ---
# Bright end_rod sparks form a visible pillar at each strike location
execute as @e[tag=ms_manus_lightning_warn] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.4 1.5 0.4 0.02 25 normal
# Electric spark overlay (added in 1.17) for the crackling electricity look
execute as @e[tag=ms_manus_lightning_warn] at @s run particle minecraft:electric_spark ~ ~0.5 ~ 0.5 1.5 0.5 0.05 15 normal

# --- Step 2: Decrement warning countdowns ---
scoreboard players remove @e[tag=ms_manus_lightning_warn] ms.manus_lw_timer 1

# --- Step 3: Strike lightning at markers whose countdown has expired ---
execute as @e[tag=ms_manus_lightning_warn,scores={ms.manus_lw_timer=..0}] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[tag=ms_manus_lightning_warn,scores={ms.manus_lw_timer=..0}] at @s run damage @a[distance=..1, limit=1] 500 lightning_bolt

# --- Step 4: Remove spent warning markers ---
kill @e[tag=ms_manus_lightning_warn,scores={ms.manus_lw_timer=..0}]
