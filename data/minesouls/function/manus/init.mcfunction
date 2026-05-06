# Manus, Father of the Abyss – Spawn function
# Run this function at the desired location inside the Abyss to summon the boss.
# Summons a Warden with 1200 HP, custom name, and Phase 1 movement speed (0.15, roughly
# half the standard Warden speed of 0.3).

summon minecraft:warden ~ ~1 ~ {Silent:1b,PersistenceRequired:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Health:1200f,Tags:["ms_manus","ms_manus_new"],CustomName:{"text":"Manus, Father of the Abyss","color":"dark_purple","bold":true},attributes:[{id:"minecraft:max_health",base:1200},{id:"minecraft:movement_speed",base:0.15},{id:"minecraft:follow_range",base:64}],Brain:{memories:{"minecraft:dig_cooldown":{value:{},ttl:1200}}}}

# Initialise per-entity scoreboard counters on the fresh Manus
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_phase 1
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_skull_timer 10
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_skull_pattern 0
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_lightning_timer 60
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_dw_timer 0

# Cleanup temporary spawn tag
tag @e[tag=ms_manus_new] remove ms_manus_new

# Create (or reset) the boss health bar
bossbar add minesouls:manus {"text":"Manus, Father of the Abyss","color":"dark_purple","bold":true}
bossbar set minesouls:manus max 1200
bossbar set minesouls:manus value 1200
bossbar set minesouls:manus color purple
bossbar set minesouls:manus players @a

# Announce the boss and play an ominous sound at Manus' spawn location
tellraw @a {"text":"You feel a sense of impending doom...","color":"dark_purple","bold":true}
execute as @e[tag=ms_manus,limit=1] at @s run playsound minecraft:entity.warden.roar hostile @a ~ ~ ~ 1 0.7

# Mark Manus as alive so the death-detection check in tick.mcfunction can fire
scoreboard players set #global ms.manus_alive 1
