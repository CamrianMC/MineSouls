# Impenetrable Wall – Warrior Tier 5 Perk 3
# Shields have infinite durability and successful shield blocks damage and
# knock back enemies in melee range.

# --- Infinite shield durability: repair shields every tick ---
execute if items entity @s weapon.offhand minecraft:shield run item modify entity @s weapon.offhand minesouls:repair_shield
execute if items entity @s weapon.mainhand minecraft:shield run item modify entity @s weapon.mainhand minesouls:repair_shield

# --- Shield block counterattack ---
# Detect a new shield block by comparing the damage_blocked_by_shield stat
execute if score @s ms.iw_blocked > @s ms.iw_prev run function minesouls:perk/warrior/t5/impenetrable_wall_block

# Update previous blocked stat for next tick comparison
scoreboard players operation @s ms.iw_prev = @s ms.iw_blocked
