# Stun tick – runs as each stunned entity.
# Decrements the stun timer and removes NoAI when the stun expires.

# Decrement timer
scoreboard players remove @s ms.stun_timer 1

# If timer expired, remove stun
execute if score @s ms.stun_timer matches ..0 run data merge entity @s {NoAI:0b}
execute if score @s ms.stun_timer matches ..0 run tag @s remove ms_stunned
