# Shinobi – Rogue Tier 5 Perk 2
# Negates all fall damage by keeping FallDistance at 0 every tick.
# The game never accumulates enough fall distance to trigger damage or landing stagger.

data modify entity @s FallDistance set value 0.0f
