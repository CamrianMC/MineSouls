# Per-player atmospheric effects for players inside the Abyss dimension.
# Called from the global tick as: execute as @a[predicate=minesouls:in_abyss] at @s

# Hovering ash particles — velocity parameter is 0 (no movement); spread (2 2 2) gives spatial scatter
particle minecraft:ash ~ ~1 ~ 2 2 2 0 5 normal

# Void-mote (squid ink) particles — spread (3 2 3) for scatter; velocity 0 keeps them hovering
particle minecraft:squid_ink ~ ~1.5 ~ 3 2 3 0 2 normal

# Darkness effect to simulate the oppressive atmosphere of the Abyss — duration 5 seconds, amplifier 0 (level 1), hidden particles
effect give @s minecraft:darkness 5 0 true

# Ensure safe teleport
execute if score @s ms.abyss_init matches 1 run fill ~-1 ~ ~-1 ~1 ~2 ~1 minecraft:air replace
execute if score @s ms.abyss_init matches 1 run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:blackstone replace
execute if score @s ms.abyss_init matches 1 if block ~ ~-1 ~ minecraft:blackstone run scoreboard players set @s ms.abyss_init 0

# Silence Wardens
execute as @e[type=minecraft:warden,distance=..100] run data merge entity @s {Silent:1b}

# Darkwraith mob: convert any hostile mob in the Abyss (except Wardens and Spiders) into Darkwraiths
execute as @e[type=#minesouls:hostile,type=!minecraft:wither,type=!minecraft:warden,type=!minecraft:spider,type=!minecraft:cave_spider,tag=!ms_living_humanity,tag=!ms_darkwraith,predicate=minesouls:in_abyss] at @s run function minesouls:darkwraith/init

# Darkwraith mob: per-entity behaviour (life steal + darkness buff)
execute as @e[tag=ms_darkwraith] at @s run function minesouls:darkwraith/tick

# Living humanity mob: convert any spider variant in the abyss to a Living Humanity, then remove the original
execute as @e[type=#minesouls:spider_variant,tag=!ms_living_humanity,predicate=minesouls:in_abyss] at @s run function minesouls:living_humanity/init
execute as @e[tag=ms_living_humanity] at @s run function minesouls:living_humanity/tick
