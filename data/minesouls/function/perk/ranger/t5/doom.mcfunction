# Doom – Ranger Tier 5 Perk 2 (per-player tick)
# Bows and crossbows charge instantly. Crossbows get Quick Charge 5.
# The spray of arrows is handled by doom_tick (global tick).

# Apply Quick Charge 5 to crossbow in main hand
execute if items entity @s weapon.mainhand minecraft:crossbow run item modify entity @s weapon.mainhand minesouls:doom_quick_charge

# Apply Quick Charge 5 to crossbow in off hand
execute if items entity @s weapon.offhand minecraft:crossbow run item modify entity @s weapon.offhand minesouls:doom_quick_charge
