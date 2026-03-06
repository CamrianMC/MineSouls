# Sent to a player who attempts to receive a second Estus Flask.
# Returns 0 so callers can use `return run function` to abort their own execution.

tellraw @s {"text":"You already carry an Estus Flask.","color":"red","italic":false}
return 0
