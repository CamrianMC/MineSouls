# Knight Artorias – Phase 2 Aura Fire
# Deals small Abyss magic damage to any player within the corruption aura (4 blocks).
# Runs as the base entity at its position.

# Reset aura timer
scoreboard players set @s ms.arta_aura_timer 20

# Deal 3 magic damage (1.5 hearts) to nearby players – bypasses armour
execute as @a[distance=..4] run damage @s 3 minecraft:magic

# Faint visual pulse so players know the aura is active
particle minecraft:sculk_soul ~ ~1 ~ 0.6 0.8 0.6 0.03 6 normal
particle minecraft:squid_ink ~ ~1 ~ 0.4 0.6 0.4 0.02 4 normal
