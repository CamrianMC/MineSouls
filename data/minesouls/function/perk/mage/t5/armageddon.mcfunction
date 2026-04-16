# Armageddon – Mage Tier 5 Perk 1
# Triggers a massive explosion at the user's location, inflicting 20 damage to all
# hostile mobs within 20 blocks. Surviving mobs are stunned for 10 seconds.
# Costs 2000 mana.

# Check mana
execute unless score @s ms.mana matches 2000.. run tellraw @s {"text":"Not enough mana!","color":"red"}
execute unless score @s ms.mana matches 2000.. run return 0

# Consume mana
scoreboard players remove @s ms.mana 2000

# Deal 20 damage to all hostiles within 20 blocks (magic damage, no knockback from source)
execute as @e[type=#minesouls:hostile,distance=..20] at @s run damage @s 20 minecraft:magic

# Stun all surviving hostiles within 20 blocks for 10 seconds (200 ticks)
# Uses the existing stun system (NoAI + ms_stunned tag + ms.stun_timer)
execute as @e[type=#minesouls:hostile,distance=..20] run data merge entity @s {NoAI:1b}
execute as @e[type=#minesouls:hostile,distance=..20] run scoreboard players set @s ms.stun_timer 200
execute as @e[type=#minesouls:hostile,distance=..20] run tag @s add ms_stunned

# Massive visual and audio feedback
playsound minecraft:entity.generic.explode player @a[distance=..64] ~ ~ ~ 2 0.5
playsound minecraft:entity.lightning_bolt.thunder player @a[distance=..64] ~ ~ ~ 2 0.8
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1
particle minecraft:explosion ~ ~1 ~ 5 3 5 0.5 50
particle minecraft:flame ~ ~1 ~ 8 3 8 0.1 100
particle minecraft:smoke ~ ~1 ~ 8 3 8 0.1 80
particle minecraft:lava ~ ~1 ~ 5 1 5 0 30

# Feedback
tellraw @s [{"text":"ARMAGEDDON!","color":"dark_red","bold":true}]
