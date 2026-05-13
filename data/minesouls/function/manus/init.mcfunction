# Manus, Father of the Abyss – Spawn function
# Run this function at the desired location inside the Abyss to summon the boss.
# Summons a Warden with 1500 HP, custom name, and Phase 1 movement speed (0.15, roughly
# half the standard Warden speed of 0.3).

summon minecraft:warden ~ ~1 ~ {Silent:1b,PersistenceRequired:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Health:1500f,Tags:["ms_manus","ms_manus_new"],CustomName:{"text":"Manus, Father of the Abyss","color":"dark_purple","bold":true},attributes:[{id:"minecraft:max_health",base:1500},{id:"minecraft:movement_speed",base:0.15},{id:"minecraft:follow_range",base:64}],Brain:{memories:{"minecraft:dig_cooldown":{value:{},ttl:1200}}}}

# Initialise per-entity scoreboard counters on the fresh Manus
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_phase 1
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_skull_timer 10
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_skull_pattern 0
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_lightning_timer 60
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_wave_timer 60
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_move_timer 100
scoreboard players set @e[tag=ms_manus_new,limit=1] ms.manus_dw_timer 0

# Add Manus to team manus so friendly-fire rules protect him from retaliating Darkwraiths
team join manus @e[tag=ms_manus_new,limit=1]

# Cleanup temporary spawn tag
tag @e[tag=ms_manus_new] remove ms_manus_new

# Create (or reset) the boss health bar
bossbar add minesouls:manus {"text":"Manus, Father of the Abyss","color":"dark_purple","bold":true}
bossbar set minesouls:manus max 1500
bossbar set minesouls:manus value 1500
bossbar set minesouls:manus color purple
bossbar set minesouls:manus players @a

# Announce the boss and play an ominous sound at Manus' spawn location
tellraw @a {"text":"You feel a sense of impending doom...","color":"dark_purple","bold":true}
execute as @e[tag=ms_manus,limit=1] at @s run playsound minecraft:entity.warden.roar hostile @a ~ ~ ~ 1 0.7

# Mark Manus as alive so the death-detection check in tick.mcfunction can fire
scoreboard players set #global ms.manus_alive 1

# ── Sif, the Great Grey Wolf ─────────────────────────────────────────────────
# Summon Sif 10 blocks to the left of Manus (local ^-10 = left of Manus's facing direction).
# PersistenceRequired prevents natural despawn; Health/attributes set her as a durable ally.
execute as @e[tag=ms_manus,limit=1] at @s run summon minecraft:wolf ^-10 ^ ^ {Silent:1b,PersistenceRequired:1b,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Health:500f,Tags:["ms_sif","ms_sif_new"],CustomName:{"text":"Sif","color":"white","bold":true},attributes:[{id:"minecraft:max_health",base:500},{id:"minecraft:follow_range",base:64},{id:"minecraft:movement_speed",base:0.35},{id:"minecraft:attack_damage",base:8}]}

# Apply the ashen (dark grey) wolf variant – matches Sif's appearance from Dark Souls 1
data modify entity @e[tag=ms_sif_new,limit=1] variant set value "minecraft:ashen"

# Join the alliance team so Sif never targets players (friendlyFire false on ms_sif_alliance)
team join ms_sif_alliance @e[tag=ms_sif_new,limit=1]

# Also add all current players to the alliance so they are mutual teammates with Sif
team join ms_sif_alliance @a

# Remove temporary spawn tag
tag @e[tag=ms_sif_new] remove ms_sif_new

# Summon the invisible sword armor stand at Sif's location.
# Small:1b halves the stand's size so the held sword sits at wolf-head height.
# ShowArms:1b is required for the mainhand item to render.
# RightArm:[-90f,0f,0f] rotates the arm forward/horizontal so the sword points
# in the direction Sif is facing, simulating the sword carried in her mouth.
execute as @e[tag=ms_sif,limit=1] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,ShowArms:1b,Small:1b,Silent:1b,PersistenceRequired:1b,CustomNameVisible:0b,DeathLootTable:"minecraft:empty",Tags:["ms_sif_sword"],equipment:{mainhand:{id:"minecraft:netherite_sword",count:1}},drop_chances:{mainhand:0.0},Pose:{RightArm:[-90f,0f,0f]}}
