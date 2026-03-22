tellraw @s {"text":"Are you sure you want to reset your class and perk selections? This cannot be undone.","color":"red"}
scoreboard players set @s ms.classperk_reset 0
tellraw @s [{text:"[Confirm Reset]",color:"gold",click_event:{"action": "run_command", "command":"/trigger ms.class_wipe set 1"}}]