# MineSouls

A Minecraft datapack template for version 1.21.10.

## Structure

This datapack follows the standard Minecraft datapack structure:

```
MineSouls/
├── pack.mcmeta                           # Datapack metadata (pack_format: 48)
├── data/
│   ├── minesouls/                        # Your namespace
│   │   └── function/
│   │       ├── load.mcfunction           # Runs once on datapack load
│   │       └── tick.mcfunction           # Runs every tick (20x/second)
│   └── minecraft/                        # Minecraft namespace
│       └── tags/
│           └── function/
│               ├── load.json             # Tags the load function
│               └── tick.json             # Tags the tick function
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

- **Minecraft Version:** 1.21.10
- **Pack Format:** 48

## Development

Add your custom functions to the `data/minesouls/function/` directory. The load and tick functions are already set up and will execute automatically.

### Load Function
The `load.mcfunction` runs once when the datapack is loaded (on `/reload` or world start).

### Tick Function
The `tick.mcfunction` runs every game tick (20 times per second).