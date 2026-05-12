# Reward function for minesouls:eucharist/consumed advancement.
# Runs as the player who just consumed a Eucharist.
#
# If the player carries any sin (ms.sin >= 1), they are killed instantly
# as divine punishment with a custom death message.  Otherwise they receive
# full healing, max saturation, and a large absorption overshield, plus the
# "Christ is King!" achievement.

# Allow the advancement to trigger again on the next use
advancement revoke @s only minesouls:eucharist/consumed

# ── SINFUL path: instant death ──────────────────────────────────────────────
# Temporarily suppress the vanilla death message so only our custom tellraw is shown.
# Note: showDeathMessages is a global gamerule; on a single-server datapack this
# window is essentially instantaneous (same tick) and practically race-free.
execute if score @s ms.sin matches 1.. run gamerule show_death_messages false
execute if score @s ms.sin matches 1.. run kill @s
execute if score @s ms.sin matches 1.. run summon minecraft:lightning_bolt ~ ~ ~
execute if score @s ms.sin matches 1.. run tellraw @a [{"selector":"@s","color":"white"}," was smited by God"]
execute if score @s ms.sin matches 1.. run gamerule show_death_messages true
# Clear sin after divine punishment
execute if score @s ms.sin matches 1.. run scoreboard players set @s ms.sin 0

# ── PURE path: divine blessing ───────────────────────────────────────────────
# Instant Health X (amplifier 9) heals 100 HP – far more than any default
# health pool, ensuring the player is fully healed regardless of max HP.
execute unless score @s ms.sin matches 1.. run effect give @s minecraft:instant_health 1 9 true

# Absorption X (amplifier 9) grants 40 extra HP (20 golden hearts) for 2 minutes.
execute unless score @s ms.sin matches 1.. run effect give @s minecraft:absorption 120 9 true

# Saturation V (amplifier 4) keeps the hunger bar full for an extended period.
execute unless score @s ms.sin matches 1.. run effect give @s minecraft:saturation 10 4 true

# Grant "Christ is King!" achievement for consuming with a pure soul
execute unless score @s ms.sin matches 1.. run advancement grant @s only minesouls:achievement/christ_is_king
