# On Shield Raise – fires when a player starts blocking with a shield.
# Revoke the advancement so it can re-trigger on the next shield raise.
advancement revoke @s only minesouls:perk/warrior/detect_shield_raise

# Turtle Shell: grant Resistance I while blocking (Warrior T1 Perk 2)
execute if score @s ms.class matches 1 if score @s ms.t1_perk matches 2 run function minesouls:perk/warrior/t1/turtle_shell

# Parry: track shield raise timing and blocked damage for parry stun (Warrior T3 Perk 3)
execute if score @s ms.class matches 1 if score @s ms.t3_perk matches 3 run function minesouls:perk/warrior/t3/parry

