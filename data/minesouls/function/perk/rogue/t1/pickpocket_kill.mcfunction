# Pickpocket – Kill reward handler
# Grants bonus XP on hostile mob kills (approximately 10% of typical mob XP).

# Revoke advancement so it can trigger again on the next kill
advancement revoke @s only minesouls:perk/rogue/t1/pickpocket

# Grant bonus XP
experience add @s 5 points
