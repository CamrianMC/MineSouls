# Explosive Shot – arrow ownership tagging (Ranger T2 Perk 2, global tick)
# Tags in-flight arrows fired by Ranger T2P2 players.
# 'on origin' resolves the arrow's shooter, so only the player's own arrows receive the
# ms_es_arrow tag. Mob-fired arrows (e.g. skeletons) are never tagged because their
# origin is not a player with the required scores.
execute as @e[type=#minesouls:arrow,tag=!ms_es_arrow,tag=!ms_doom_spray] at @s on origin if entity @s[scores={ms.class=3,ms.t2_perk=2}] run tag @e[type=#minesouls:arrow,distance=..0.01,limit=1] add ms_es_arrow
