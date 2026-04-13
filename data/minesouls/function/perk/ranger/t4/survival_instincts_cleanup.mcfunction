# Survival Instincts cleanup – remove glowing from tagged mobs that are no longer
# within range of a sneaking Ranger with Survival Instincts.
# Runs globally as each ms_si_glowing entity.

# If no Survival Instincts Ranger is sneaking within 20 blocks, remove glowing
execute unless entity @a[scores={ms.class=3,ms.t4_perk=1},tag=ms_si_active,distance=..20] run effect clear @s minecraft:glowing
execute unless entity @a[scores={ms.class=3,ms.t4_perk=1},tag=ms_si_active,distance=..20] run tag @s remove ms_si_glowing
