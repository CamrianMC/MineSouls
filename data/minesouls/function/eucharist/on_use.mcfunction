# Reward function for minesouls:eucharist/consumed advancement.
# Runs as the player who just consumed a Eucharist.
#
# If the player carries any sin (ms.sin >= 1), they are killed instantly
# as divine punishment.  Otherwise they receive full healing, max saturation,
# and a large absorption overshield.

# Allow the advancement to trigger again on the next use
advancement revoke @s only minesouls:eucharist/consumed

# ── SINFUL path: instant death ──────────────────────────────────────────────
execute if score @s ms.sin matches 1.. run kill @s
execute if score @s ms.sin matches 1.. run summon minecraft:lightning_bolt ~ ~ ~

# ── PURE path: divine blessing ───────────────────────────────────────────────
# Instant Health X (amplifier 9) heals 100 HP – far more than any default
# health pool, ensuring the player is fully healed regardless of max HP.
execute unless score @s ms.sin matches 1.. run effect give @s minecraft:instant_health 1 9 true

# Absorption X (amplifier 9) grants 40 extra HP (20 golden hearts) for 2 minutes.
execute unless score @s ms.sin matches 1.. run effect give @s minecraft:absorption 120 9 true

# Saturation V (amplifier 4) keeps the hunger bar full for an extended period.
execute unless score @s ms.sin matches 1.. run effect give @s minecraft:saturation 10 4 true
