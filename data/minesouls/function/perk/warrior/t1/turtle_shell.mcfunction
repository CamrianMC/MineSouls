# Turtle Shell – Warrior Tier 1 Perk 2
# While blocking: grants Resistance I if the player has no resistance.
# If the player already has an external Resistance effect, upgrades them to Resistance II instead.
# Uses the ms_turtle_res tag to track whether resistance was perk-sourced or came from an external source.

# No resistance: mark as perk-sourced first (tag add must run before effect give to avoid false NBT mismatch)
execute unless entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] run tag @s add ms_turtle_res
execute unless entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] run effect give @s minecraft:resistance 3 0 true

# External resistance present (no perk tag): upgrade to Resistance II
execute if entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] unless entity @s[tag=ms_turtle_res] run effect give @s minecraft:resistance 3 1 true

# Perk-only resistance (tag present): refresh Resistance I only
execute if entity @s[nbt={active_effects:[{id:"minecraft:resistance"}]}] if entity @s[tag=ms_turtle_res] run effect give @s minecraft:resistance 3 0 true
