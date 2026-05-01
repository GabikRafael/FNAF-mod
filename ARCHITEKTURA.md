# FNAF Mod - Architektura a Technická Dokumentace

Detailní technická dokumentace o struktuře a principech fungování FNAF Modu.

## 📐 Architektura Modu

```
FNAF Mod
│
├── Behavior Pack (Logika a Chování)
│   ├── Entities (Entity Definitions)
│   │   ├── 5x Animatroniky (freddy, chica, bonnie, foxy, golden_freddy)
│   │   └── 1x Marker (neviditelný bod)
│   │
│   ├── Functions (Příkazové Funkce)
│   │   ├── setup.mcfunction (Inicializace)
│   │   ├── main.mcfunction (Hlavní smyčka)
│   │   ├── daytime_cycle.mcfunction (Denní režim)
│   │   ├── nighttime_cycle.mcfunction (Noční režim)
│   │   └── activate_hunting.mcfunction (Aktivace lovu)
│   │
│   └── Animations (Logiké animace)
│       └── fnaf.animations.json (Definice animací)
│
└── Resource Pack (Vizuálce)
    ├── Models (3D/Blockbench Modely)
    │   ├── 5xEntity Models (.json)
    │   └── 1x Marker Model
    │
    ├── Textures (PNG Textury)
    │   ├── 5x Animatron Textury (32x32)
    │   └── Marker Texture
    │
    ├── Animations (Grafické Animace)
    │   └── fnaf.animations.json
    │
    ├── Animation Controllers (Řízení Animací)
    │   └── fnaf.animation_controllers.json
    │
    └── Entity Definitions (Klientské Definice)
        └── 6x Entity JSON Soubory
```

## 🔄 Tok Dat - Den/Noc Cyklus

```
┌─────────────────────────────────────┐
│     MINECRAFT GAME TICK             │
│     (20 ticks/sec)                  │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│  /function fnaf:main                │
│  (Hlavní Smyčka)                    │
└──────────────┬──────────────────────┘
               │
     ┌─────────┴──────────┐
     ▼                    ▼
┌─────────────┐    ┌────────────────┐
│ DEN         │    │ NOC            │
│ (0-13000)   │    │ (13000-24000)  │
│ време       │    │ vrijeme        │
└──────┬──────┘    └────────┬───────┘
       │                    │
       ▼                    ▼
┌─────────────────────────────────────┐
│ event entity                        │
│ fnaf:switch_to_daytime/nighttime    │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│ Component Groups Aktivace           │
│ - fnaf:daytime (pasivní)           │
│ - fnaf:nighttime (agresivní)       │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│ Animation Controller Přepnutí       │
│ - controller.animation.fnaf.daytime │
│ - controller.animation.fnaf.nighttime│
└─────────────────────────────────────┘
```

## 🎭 Component Groups Struktura

### Daytime Mode (fnaf:daytime)
```json
{
  "minecraft:behavior.stay_while_sitting": {
    "priority": 0
  },
  "minecraft:behavior.random_stroll": {
    "priority": 1,
    "speed_multiplier": 0.0  // Bez pohybu
  },
  "minecraft:animation_controller": {
    "controllers": ["controller.animation.fnaf.daytime"]
  }
}
```

**Příznaky:**
- Entita zůstává na místě
- Hraje showtime animace
- Žádné pronásledování

### Nighttime Mode (fnaf:nighttime)
```json
{
  "minecraft:behavior.hurt_by_target": {
    "priority": 0
  },
  "minecraft:behavior.pursue_target": {
    "priority": 1,
    "target_types": ["player", "villager"],
    "within_radius": 40.0,
    "speed_multiplier": 0.6
  },
  "minecraft:behavior.melee_attack": {
    "priority": 2,
    "speed_multiplier": 1.2
  }
}
```

**Příznaky:**
- Pronásledování hráčů
- Útok v blízkosti
- Vyšší rychlost

## 📊 Entity Specifikace vs Chování

| Komponenta | Daytime | Nighttime | Popis |
|-----------|---------|-----------|--------|
| pursue_target | ❌ | ✅ | Pronásleduje cíle |
| melee_attack | ❌ | ✅ | Útočí v blízkosti |
| random_stroll | ✅ (0x) | ✅ (0.2-0.35x) | Náhodný pohyb |
| animation_controller | Daytime | Nighttime | Která sada animací se hraje |

## 🎯 Animační Tok

```
Query State (Dotaz Status)
    ↓
Animation Controller (Řídící)
    ↓
Decision (Jakou animaci přehrát?)
    ↓
Animation Playback (Přehrát konkrétní animaci)
    ↓
Mesh Deformation (Deformace 3D modelu)
    ↓
Textura (Zobrazení)
```

### Příklad - Walk Animation v Nighttime

```
query.is_moving > 0 (Entita se pohybuje?)
    ↓ (ANO)
controller.animation.fnaf.nighttime aktivní
    ↓
Přejdi do stavu "hunting"
    ↓
Přehraj animaci "animation.fnaf.walk"
    ↓
Pohyb nohou se animuje
    ↓
Zahraj chůzi animaci vizuálně
```

## 💾 Data Persistence

### Scoreboard Objectives

```
fnaf_time           | Sledování herního času
fnaf_showtime_type  | Typ showtime (1=zpěv, 2=tanec, 3=kytara)
fnaf_day_night      | Stav den/noc (0=den, 1=noc)
```

### Entity Data

Každá entita si pamatuje:
- **Component Groups** - Která group je aktivní
- **Health** - Zbývající zdraví
- **Target** - Kterého hráče/vesničana pronásleduje
- **Animation State** - Která animace se hraje

## 🔌 Senzory a Detektory

Animatroniky používají tyto senzory:

1. **Nearest Player Sensor**
   - Detektuje nejbližšího hráče
   - Range: 35-50 bloků
   - Must see: true (musí vidět)

2. **Hurt-by-Target Sensor**
   - Když je animatron poškozen
   - Zapamatuje si útočníka
   - Pronásleduje ho

3. **Time Sensor** (v CommandBlocku)
   - Query game time
   - if time matches 0..100 = den
   - if time matches 13000 = noc

## 📡 Event Systém

### Zásadní Events

```
minecraft:entity_spawned
    └─> fnaf:switch_to_daytime  (Výchozí - pasivní režim)

--- Během hry ---

fnaf:switch_to_nighttime
    ├─> remove: fnaf:daytime
    └─> add: fnaf:nighttime

fnaf:switch_to_daytime
    ├─> remove: fnaf:nighttime
    └─> add: fnaf:daytime

fnaf:take_damage
    └─> play_damaged_sound (Zvuk poškození)
```

## ⚙️ Konfigurační Parametry

### Health (Zdraví)
```
freddy: 50           # Vyrovnaný
chica: 45            # Slabší
bonnie: 48           # Vyrovnaný
foxy: 52             # Silnější
golden_freddy: 60    # Nejsilnější
```

### Nighttime Speed
```
freddy: 0.6x         # Střední
chica: 0.5x          # Nejpomalejší
bonnie: 0.65x        # Střední
foxy: 0.8x           # Nejrychlejší
golden_freddy: 0.7x  # Střední
```

### Pursuit Range
```
freddy: 40 bloků
chica: 35 bloků      # Nejmenší
bonnie: 38 bloků
foxy: 45 bloků       # Největší
golden_freddy: 50 bloků # Největší
```

## 🐛 Debug Mód

Aktivuje se příkazy:

```
# Zobrazit animatroniky v debug módu
/execute as @e[family=fnaf] run say Status: @s

# Zobrazit component groups
/execute as @e[family=freddy] run say Aktiv

# Sledovat zdraví
/execute as @e[family=fnaf] run scoreboard players display name health @s
```

## 📈 Výkonové Optimalizace

### Tick-Based vs Time-Based

```
Naivní: Každý tick (20x/sec) - POMALÉ
/execute as @e[family=fnaf] run ...

Efektivní: Se zpoždět (repeat command block)
function fnaf:main  |  Delay: 20 ticks (1 sec)
```

### Entity Culling

```
Bez optimalizace: 5 animatronů = 5 AI výpočtů/tick
S optimalizací:
- Jen viditelné entity pronásledují
- Ostatní jsou "spící"
```

## 🔄 Cyklus a Smyčka Detailu

```
TICK 0:   /function fnaf:main
  ├─ query time
  ├─ if 0-100: run daytime_cycle
  │    └─ event daytime na všech
  │    └─ tp na markery
  └─ if 13000: run nighttime_cycle
       └─ event nighttime na všech
       └─ aktivace lovu

TICK 1-19: Entity AI běží normálně
  ├─ Pronásledování (nighttime)
  ├─ Animace se přehrávají
  └─ Fyzika se počítá

TICK 20: /function fnaf:main znovu
  └─ Cyklus se opakuje...
```

---

## 📚 Reference

- [Minecraft Bedrock Entity Documentation](https://learn.microsoft.com/en-us/minecraft/creator/reference/content/entityreference/)
- [Animation Controllers](https://learn.microsoft.com/en-us/minecraft/creator/reference/content/Entityreference/examples/entity_intro_animation_controllers)
- [Behavior Packs](https://learn.microsoft.com/en-us/minecraft/creator/documents/behaviorpack)

---

**Technická dokumentace FNAF Modu - hotova! 🔧**
