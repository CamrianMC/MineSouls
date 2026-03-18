# MineSouls

## Structure

```
MineSouls/
├── pack.mcmeta                                     # Datapack metadata (pack_format: 61)
├── assets/
│   └── minesouls/
│       ├── items/                                  # Item definition files
│       │   ├── darksign.json
│       │   ├── estus_flask.json
│       │   ├── estus_flask_empty.json
│       │   └── flask_of_wondrous_physik.json
│       └── models/
│           └── item/                              # Item model files
│               ├── darksign.json
│               ├── estus_flask.json
│               ├── estus_flask_empty.json
│               └── flask_of_wondrous_physik.json
├── data/
│   ├── bonfire/                                   # Bonfire structure namespace
│   │   ├── structures/
│   │   │   └── bonfire.nbt                        # Bonfire structure template
│   │   ├── tags/
│   │   │   └── worldgen/
│   │   │       └── biome/                         # Biome tags for structure spawning
│   │   │           ├── has_bonfire_end.json
│   │   │           ├── has_bonfire_nether.json
│   │   │           └── has_bonfire_overworld.json
│   │   └── worldgen/
│   │       ├── configured_structure_feature/
│   │       │   └── bonfire.json
│   │       ├── structure_set/
│   │       │   └── bonfire.json
│   │       └── template_pool/
│   │           └── bonfire.json
│   ├── minecraft/                                 # Minecraft namespace overrides
│   │   └── tags/
│   │       └── function/
│   │           ├── load.json                      # Tags the load function
│   │           └── tick.json                      # Tags the tick function
│   └── minesouls/                                 # Main namespace
│       ├── advancement/
│       │   ├── bonfire/
│       │   │   └── resting.json
│       │   ├── darksign/
│       │   │   └── used.json
│       │   ├── estus_flask/
│       │   │   └── consumed.json
│       │   └── flask_of_wondrous_physik/
│       │       ├── consumed.json
│       │       └── cycling.json
│       ├── function/
│       │   ├── load.mcfunction                    # Runs once on datapack load
│       │   ├── tick.mcfunction                    # Runs every tick (20x/second)
│       │   ├── bonfire/
│       │   │   ├── init_player.mcfunction
│       │   │   ├── on_respawn.mcfunction
│       │   │   ├── rest.mcfunction
│       │   │   ├── teleport_home.mcfunction
│       │   │   └── teleport_macro.mcfunction
│       │   ├── darksign/
│       │   │   ├── give.mcfunction
│       │   │   ├── on_use.mcfunction
│       │   │   ├── resolve.mcfunction
│       │   │   └── tick.mcfunction
│       │   ├── estus_flask/
│       │   │   ├── check_limit.mcfunction
│       │   │   ├── clear_excess.mcfunction
│       │   │   ├── give.mcfunction
│       │   │   ├── give_depleted.mcfunction
│       │   │   ├── give_macro.mcfunction
│       │   │   ├── give_refused.mcfunction
│       │   │   ├── on_use.mcfunction
│       │   │   └── track_uses.mcfunction
│       │   └── flask_of_wondrous_physik/
│       │       ├── check_limit.mcfunction
│       │       ├── clear_excess.mcfunction
│       │       ├── cycle.mcfunction
│       │       ├── give.mcfunction
│       │       ├── on_use.mcfunction
│       │       └── update_item.mcfunction
│       └── predicate/
│           ├── in_end.json
│           ├── in_nether.json
│           ├── in_overworld.json
│           └── resting_at_bonfire.json
```

## Installation

1. Download or clone this datapack
2. Place the entire folder into your world's `datapacks` folder:
   - `.minecraft/saves/[your_world]/datapacks/`
3. Run `/reload` in-game or restart the world

## Usage

This is a template datapack. To use it:

1. Modify the functions in `data/minesouls/function/` to add your custom logic
2. Create additional functions as needed
3. Update the namespace if desired (remember to update all references)

## Version Compatibility

- **Minecraft Version:** 1.21.4+
- **Pack Format:** 61
