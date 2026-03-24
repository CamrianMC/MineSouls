# Shinobi – Rogue Tier 5 Perk 2
# Negates all fall damage.
# The negation is handled by the entity_hurt_player advancement
# (shinobi_hit.mcfunction) which fires before the death check.
# This tick function keeps ms.shinobi_prev in sync with current health
# to account for non-damage health changes (healing, regeneration, eating, etc.).

scoreboard players operation @s ms.shinobi_prev = @s ms.health
