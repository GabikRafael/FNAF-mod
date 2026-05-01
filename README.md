# FNAF Mod - Five Nights at Freddy's for Minecraft Bedrock

Moderátorský mod, který přináší Five Nights at Freddy's animatroniky do Minecraft Bedrock Edition! Tento mod obsahuje komplexní systém den/noc s agresivními animatroniky, animacemi a interaktivním prvky.

## 📋 Obsah modu

### Animatroniky (5 entit)
- **Freddy Fazbear** - Vedoucí skupiny, silný a všestranný
- **Chica** - Menší, rychlejší, specialista na blízký boj
- **Bonnie** - Vyrovnaný, střední síla a rychlost
- **Foxy** - Nejrychlejší, nejnebezpečnější v noci
- **Golden Freddy** - Nejsilnější, nejpomalejší

### Markery (5 entit)
Neviditelné body, na kterých stojí animatroniky během dne (showtime)

### Systém Den/Noc
- **DEN (Showtime - 0:00-13:00):**
  - Animátroni hrají showtime animace (zpěv, tanec, kytara)
  - Teleportováni na své Markery
  - Pasivní chování - neútočí
  
- **NOC (Lov - 13:00-23:59):**
  - Aktivuje se útočné AI
  - Pronásledují hráče, vesničany a děti
  - Robotická a strašidelná chůze
  - Útočí když se přiblíží

## 🎮 Jak používat

### Instalace

1. **Behavior Pack**: Zkopíruj složku `behavior_pack` do tvého Minecraft Bedrock `behavior_packs` adresáře
2. **Resource Pack**: Zkopíruj složku `resource_pack` do tvého Minecraft Bedrock `resource_packs` adresáře
3. Aktivuj oba packs v nastavení světa

### Příkazy v Comandech

Spusť tyto příkazy v tvém světě:

```
# Inicializace (jedenkrát na začátku)
function fnaf:setup

# Spusť hlavní smyčku (měl by běžet na repeat command blocku)
function fnaf:main
```

### Spawnování Animatronů

```
# Spawnuj konkrétního animatrona
summon fnaf:freddy
summon fnaf:chica
summon fnaf:bonnie
summon fnaf:foxy
summon fnaf:golden_freddy

# Spawnuj Marker
summon fnaf:marker
```

## 🏛️ Struktura modu

```
FNAF-mod/
├── behavior_pack/
│   ├── manifest.json
│   ├── entities/
│   │   ├── freddy.json
│   │   ├── chica.json
│   │   ├── bonnie.json
│   │   ├── foxy.json
│   │   ├── golden_freddy.json
│   │   └── marker.json
│   ├── animations/
│   │   └── fnaf.animations.json
│   ├── animation_controllers/
│   ├── functions/
│   │   ├── setup.mcfunction
│   │   ├── main.mcfunction
│   │   ├── daytime_cycle.mcfunction
│   │   ├── nighttime_cycle.mcfunction
│   │   └── activate_hunting.mcfunction
│
├── resource_pack/
│   ├── manifest.json
│   ├── animations/
│   │   └── fnaf.animations.json
│   ├── animation_controllers/
│   │   └── fnaf.animation_controllers.json
│   ├── models/entity/
│   │   ├── freddy.json
│   │   ├── chica.json
│   │   ├── bonnie.json
│   │   ├── foxy.json
│   │   └── golden_freddy.json
│   ├── entity/
│   │   ├── freddy.json
│   │   ├── chica.json
│   │   ├── bonnie.json
│   │   ├── foxy.json
│   │   ├── golden_freddy.json
│   │   └── marker.json
│   └── textures/entity/
│       ├── freddy.png
│       ├── chica.png
│       ├── bonnie.png
│       ├── foxy.png
│       └── golden_freddy.png
```

## 🎨 Animace

Každý Animatron má následující animace:

- **Idle** - Klid
- **Walk** - Robotická chůze
- **Attack** - Útok/výpad
- **Jumpscare** - Strašidelné skočení
- **Singing** - Zpívání (showtime)
- **Dancing** - Tanec (showtime)
- **Guitar** - Hra na kytaru (showtime)

## 🔧 Technické nastavení

### Component Groups

Každá entita má dvě skupiny komponent:

1. **fnaf:daytime** - Pasivní showtime režim
   - Vypnuté útoky
   - Showtime animace
   - Bez AI pronásledování

2. **fnaf:nighttime** - Agresivní lovecký režim
   - Zapnuté útočné chování
   - Senzory na hráče/vesničany
   - Pronásledování a útok

### Scoreboard Objectives

- `fnaf_time` - Sledování času
- `fnaf_showtime_type` - Typ showtime (1=zpěv, 2=tanec, 3=kytara)
- `fnaf_day_night` - Status den/noc

## 🎯 Specifikace Animatronů

| Animatron | Health | Speed | Range | Schopnosti |
|-----------|--------|-------|-------|-----------|
| Freddy | 50 | 0.6 (night) | 40 | Vyrovnaný |
| Chica | 45 | 0.5 (night) | 35 | Nejrychlejší |
| Bonnie | 48 | 0.65 (night) | 38 | Vyrovnaný |
| Foxy | 52 | 0.8 (night) | 45 | Nejsilnější útok |
| Golden Freddy | 60 | 0.7 (night) | 50 | Nejsilnější & Největší range |

## 📝 Poznámky

- Animatroniky neútočí na sebe navzájem (mají stejnou rodinu `fnaf`)
- Markery by měly mít jména pro automatické teleportování: `marker_freddy`, `marker_chica`, atd.
- Doporučuje se spustit `fnaf:main` na repeat command blocku s delay 1 tick
- Showtime animace se přehrávají jen během dne (0:00-13:00 mc času)

## 🐛 Řešení problémů

**Animatroniky se neteleportují na Markery:**
- Zkontroluj, zda existují Markery s správnými názvy
- Spusť comando: `summon fnaf:marker ~ ~ ~ {"CustomName":"marker_freddy"}`

**Animace se nehrají:**
- Zkontroluj, zda je Resource Pack aktivován
- Ověř, že entity mají přiřazené animace v animation_controllers

**Animatroniky neútočí v noci:**
- Zkontroluj čas v herním světě
- Spusť: `time set 13000` pro aktivaci nočního režimu

## 📦 Požadavky

- Minecraft Bedrock Edition 1.18.0 nebo novější
- Experimental Features - Entities 0.1+
- Behavior Pack a Resource Pack obě aktivovány

## 🔮 Budoucí rozšíření

- [ ] Speciální zvuky a hudba
- [ ] Kamera v kancéláři (spectator mode)
- [ ] Power management systém
- [ ] Další animatroniky (Puppet, Others)
- [ ] Custom showtime choreografie

---

**Vytvořeno pro Minecraft Bedrock FNAF fany! 🎃**