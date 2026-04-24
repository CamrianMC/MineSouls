# Darkwraith – Per-entity behaviour tick.
# Runs as @e[tag=ms_darkwraith] at @s (each living Darkwraith).

# --- Life steal ---
# A player hurt within melee range (≤3 blocks) likely received this hit.
# Check HurtTime=10 (current-tick damage) and HurtTime=9 (entity-tick order offset),
# matching the same pattern used by the Beast Mastery wolf heal.
execute if entity @a[distance=..3,nbt={HurtTime:10s}] run function minesouls:darkwraith/lifesteal
execute unless entity @a[distance=..3,nbt={HurtTime:10s}] if entity @a[distance=..3,nbt={HurtTime:9s}] run function minesouls:darkwraith/lifesteal

# --- Low-light strength bonus ---
# Strength I (hidden particles) while ambient light level ≤ 4.
# Refreshed every tick so it stays active as long as darkness persists.
execute if predicate minesouls:in_darkness run effect give @s minecraft:strength 3 0 true
