# Parry – Warrior Tier 3 Perk 3
# Called once when the player raises their shield (via detect_shield_raise advancement).
# Opens an 11-tick parry window. If the player blocks an attack during that window,
# the nearest hostile within 4 blocks is stunned for 5 seconds.
# 3-second (60 tick) cooldown to prevent spamming.

# --- Cooldown check: skip if still on cooldown ---
execute if score @s ms.parry_cd matches 1.. run return 0

# Parry cooldown to avoid spam (60 ticks = 3 seconds)
scoreboard players set @s ms.parry_cd 60

# Audio feedback for raising the shield (same sound as blocking, but louder and lower-pitched to distinguish it)
playsound minecraft:entity.player.attack.sweep player @s ~ ~ ~ 1 0.5

# --- Open the parry window (11 ticks) ---
scoreboard players set @s ms.parry_timer 11

# --- Snapshot the current blocked-damage stat so we can detect new blocks ---
scoreboard players operation @s ms.parry_prev = @s ms.parry_blocked