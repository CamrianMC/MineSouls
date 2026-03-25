# Pickpocket – Rogue Tier 1 Perk 3
# Grants permanent Luck I effect.
# The 10% bonus XP on hostile kills is handled by the pickpocket advancement.

execute unless entity @s[tag=ms_pickpocket_active] run effect give @s minecraft:luck infinite 0 true
tag @s add ms_pickpocket_active
