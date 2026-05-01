# FNAF Mod - Přehled Projektu

Úplný přehled všech souborů a struktury FNAF Modu pro Minecraft Bedrock.

## 📊 Souhrnné Čísla

- **Animatroniky**: 5 (Freddy, Chica, Bonnie, Foxy, Golden Freddy)
- **Markery**: 1 entita (neviditelné body pro showtime)
- **Soubory**: 50+ JSON, mcfunction, md dokumenty
- **Funkce**: Den/noc cyklus, showtime animace, pronásledování, útok
- **Dokumentace**: 5 komplexních průvodců

## 📁 Kompletní Struktura

```
FNAF-mod/
│
├── 📄 README.md                           (Hlavní dokumentace)
├── 📄 PRUVODCE_NASTAVENIM.md             (Instalace & Setup)
├── 📄 TEXTURY_A_MODELY.md                (Tvorba textur & modelů)
├── 📄 ARCHITEKTURA.md                    (Technická dokumentace)
├── 📄 RESENI_PROBLEMU.md                 (FAQ & Troubleshooting)
│
├── 📦 behavior_pack/
│   ├── 📄 manifest.json                  (Pack metadata)
│   │
│   ├── 📂 entities/
│   │   ├── 📄 freddy.json                (Freddy entity definition)
│   │   ├── 📄 chica.json                 (Chica entity definition)
│   │   ├── 📄 bonnie.json                (Bonnie entity definition)
│   │   ├── 📄 foxy.json                  (Foxy entity definition)
│   │   ├── 📄 golden_freddy.json         (Golden Freddy entity definition)
│   │   └── 📄 marker.json                (Invisible Marker entity)
│   │
│   ├── 📂 animations/
│   │   └── 📄 fnaf.animations.json       (Behavior animations)
│   │
│   ├── 📂 animation_controllers/
│   │   (Prázdno - pro rozšíření)
│   │
│   └── 📂 functions/
│       ├── 📄 setup.mcfunction           (Inicializace scoreboarda)
│       ├── 📄 main.mcfunction            (Hlavní smyčka den/noc)
│       ├── 📄 daytime_cycle.mcfunction   (Denní režim - showtime)
│       ├── 📄 nighttime_cycle.mcfunction (Noční režim - lov)
│       └── 📄 activate_hunting.mcfunction(Aktivace pronásledování)
│
└── 📦 resource_pack/
    ├── 📄 manifest.json                  (Pack metadata)
    │
    ├── 📂 models/entity/
    │   ├── 📄 freddy.json                (Freddy 3D model)
    │   ├── 📄 chica.json                 (Chica 3D model)
    │   ├── 📄 bonnie.json                (Bonnie 3D model)
    │   ├── 📄 foxy.json                  (Foxy 3D model)
    │   └── 📄 golden_freddy.json         (Golden Freddy 3D model)
    │
    ├── 📂 animations/
    │   └── 📄 fnaf.animations.json       (Visual animations)
    │
    ├── 📂 animation_controllers/
    │   └── 📄 fnaf.animation_controllers.json (Animation state machine)
    │
    ├── 📂 entity/
    │   ├── 📄 freddy.json                (Freddy client entity)
    │   ├── 📄 chica.json                 (Chica client entity)
    │   ├── 📄 bonnie.json                (Bonnie client entity)
    │   ├── 📄 foxy.json                  (Foxy client entity)
    │   ├── 📄 golden_freddy.json         (Golden Freddy client entity)
    │   └── 📄 marker.json                (Marker client entity)
    │
    └── 📂 textures/entity/
        ├── 📄 README.md                  (Texture creation guide)
        ├── 📄 freddy.png                 (Freddy texture) [TODO]
        ├── 📄 chica.png                  (Chica texture) [TODO]
        ├── 📄 bonnie.png                 (Bonnie texture) [TODO]
        ├── 📄 foxy.png                   (Foxy texture) [TODO]
        └── 📄 golden_freddy.png          (Golden Freddy texture) [TODO]
```

## ✅ Dokončené Komponenty

### Behavior Pack (100%)
- ✅ Všechny 5 animatroniku definicí
- ✅ Marker entita
- ✅ Den/noc cyklus systém
- ✅ Component groups (daytime/nighttime)
- ✅ AI chování (pronásledování, útok)
- ✅ Command funkce (setup, main, cykly)
- ✅ Scoreboard objectives

### Resource Pack (95%)
- ✅ Animační definice (7 animací na entity)
- ✅ Animation controllers (daytime/nighttime režimy)
- ✅ 3D Blockbench modely (všechny animatroniky)
- ✅ Client entity definice
- ⏳ PNG Textury [Nutno vytvořit]

### Dokumentace (100%)
- ✅ README.md - Hlavní průvodce
- ✅ PRUVODCE_NASTAVENIM.md - Instalace
- ✅ TEXTURY_A_MODELY.md - Tvorba assetů
- ✅ ARCHITEKTURA.md - Technické detaily
- ✅ RESENI_PROBLEMU.md - Troubleshooting

## 🎯 Co Zbývá (Optional)

### Pro Plně Funkční Mod
1. **Textury** - Vytvoření 5x PNG souborů (32x32 pixelů)
   - freddy.png (hnědý medvěd)
   - chica.png (žlutá kuřka)
   - bonnie.png (purpurový králík)
   - foxy.png (rudá liska)
   - golden_freddy.png (zlatý medvěd)

2. **Zvuky** (Optional rozšíření)
   - Jumpscare zvuk
   - Pronásledující zvuk
   - Showtime hudba

3. **Pokročilé Funkce** (Optional)
   - Power Management systém
   - Camera/CCTV systém
   - Dodatečné animatroniky
   - Custom mapy s Freddy Fazbear Pizzerií

## 🚀 Jak Začít

### 1. Instalace
```bash
# Zkopíruj behavior_pack a resource_pack do Minecraftu
# Viz PRUVODCE_NASTAVENIM.md pro detaily
```

### 2. Inicializace v Hře
```
/function fnaf:setup
summon fnaf:freddy
/function fnaf:main
```

### 3. Vytvoření Textur
```
# Viz TEXTURY_A_MODELY.md
# Vytvoř 5x PNG soubory do resource_pack/textures/entity/
```

### 4. Testing
```
/time set 0       # Den
/time set 13000   # Noc
```

## 📊 Specifikace Animatronů

| Animatron | HP | Noc Speed | Range | Specialita |
|-----------|-------|-----------|--------|-----------|
| **Freddy** | 50 | 0.6x | 40 | Vedoucí, vyrovnaný |
| **Chica** | 45 | 0.5x | 35 | Nejmenší range |
| **Bonnie** | 48 | 0.65x | 38 | Středně silný |
| **Foxy** | 52 | 0.8x | 45 | Nejrychlejší |
| **Golden Freddy** | 60 | 0.7x | 50 | Nejsilnější |

## 🎨 Animace (7 na Animatrona)

1. **Idle** - Klid na místě
2. **Walk** - Robotická chůze
3. **Attack** - Útok/výpad
4. **Jumpscare** - Strašidelné skočení
5. **Singing** - Zpívání (showtime)
6. **Dancing** - Tanec (showtime)
7. **Guitar** - Kytara (showtime)

## 🔧 Technické Detaily

### JSON Soubory
- **Entity Definitions**: 6 JSON (5 animatronů + marker)
- **Animations**: 2 JSON (resource + behavior)
- **Animation Controllers**: 1 JSON (state machine)
- **Function Files**: 5 mcfunction (příkazy/logika)
- **Manifests**: 2 JSON (pack metadata)

### Celkem Souborů
- **JSON**: 13+
- **mcFunction**: 5
- **Markdown**: 5
- **PNG**: 5 [TODO]
- **Celkem**: 28+ souborů

## 💻 Systémové Požadavky

- Minecraft Bedrock Edition 1.18.0+
- Experimental Features (entity updates)
- ~5-10 MB disk space (bez textur)
- Stabilní FPS (15+ FPS)

## 🎓 Vzdělávací Obsah

Tento mod demonstruje:
- Entity definition v Bedrock Edition
- Animation controllers & state machines
- Behavior packs & resource packs
- Command functions & McFunctionality
- Component groups & events
- Entity AI & targeting

## 📚 Dokumentace Index

1. **README.md** - Start here! Úvod a základní info
2. **PRUVODCE_NASTAVENIM.md** - Instalace a setup
3. **TEXTURY_A_MODELY.md** - Asset creation
4. **ARCHITEKTURA.md** - Deep dive techniky
5. **RESENI_PROBLEMU.md** - Debugging & FAQ

## 🤝 Kontribuce

Pro přidání vlastních prvků:
1. Vytvoř nový entity soubor v behavior_pack/entities/
2. Vytvoř model v resource_pack/models/entity/
3. Vytvoř texture v resource_pack/textures/entity/
4. Vytvoř client entity v resource_pack/entity/
5. Přidej animace v resource_pack/animations/

## 📝 Licenční Poznámka

FNAF Mod je fan projekt inspirovaný Five Nights at Freddy's.
Všechny modely a koncepty jsou původní tvorby pro tento mod.

---

## 📞 Support

Pokud narazíš na problém:
1. Zkontroluj **RESENI_PROBLEMU.md**
2. Ověř si správnost instalace v **PRUVODCE_NASTAVENIM.md**
3. Zkontroluj JSON validitu
4. Zkus `/reload` v hře

---

**FNAF Mod - Kompletní Přehled ✅**
*Vytvořeno: 2026*
