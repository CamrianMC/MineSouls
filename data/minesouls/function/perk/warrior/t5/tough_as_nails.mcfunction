# Tough as Nails – Warrior Tier 5 Perk 2
# Cannot take more than 5 damage in one hit.
# The damage cap is enforced by the entity_hurt_player advancement
# (tough_as_nails_hit.mcfunction) which fires immediately when damage is taken,
# before the death check – preventing fatal one-shots.
# This tick function keeps ms.tan_prev in sync with the player's current health
# to account for non-damage health changes (healing, regeneration, eating, etc.).

scoreboard players operation @s ms.tan_prev = @s ms.health
