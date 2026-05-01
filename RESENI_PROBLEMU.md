# FNAF Mod - Řešení Problémů

Kompletní příručka pro řešení nejčastějších problémů s FNAF Modem.

## ❌ Animatroniky se neobjevují

### Příznak
Při spawnutí příkazem se nic nezobrazuje nebo se zobrazuje fialový checkerboard.

### Řešení

**Krok 1: Zkontroluj Resource Pack**
```
1. Jdi do Nastavení > Manage Packs
2. Ověř, že "FNAF-resource-pack" je aktivován
3. Přesunov na ZAČÁTEK seznamu (priorities)
4. Zkus /reload
```

**Krok 2: Zkontroluj Behavior Pack**
```
1. Zkontroluj manifest.json v behavior_packu
2. Ověř UUID (měl by být unikátní)
3. Format version: "2" nebo novější
```

**Krok 3: Zkontroluj Identifier**
```
Spravné jméno entity:
- fnaf:freddy (NE freddy:entity)
- fnaf:chica
- fnaf:bonnie
- fnaf:foxy
- fnaf:golden_freddy
```

**Krok 4: Spustit Reset**
```
/reload
/function fnaf:setup
summon fnaf:freddy ~ ~ ~
```

---

## 👻 Animace se nehrají

### Příznak
Animatroniky jsou vidět, ale nemají animace (stojí bez pohybu, nechodí).

### Řešení

**Krok 1: Zkontroluj Resource Pack Pořadí**
```
Pořadí MUSÍ být:
1. FNAF-resource-pack (TOP)
2. Vanilla Resource Pack (dole)

Pokud ne, přetáhni FNAF-resource-pack nahoru.
```

**Krok 2: Ověř Namen Animací**
```
V resource_pack/entity/freddy.json zkontrolovat:
"animations": {
  "walk": "animation.fnaf.walk",  ✅ Správné
  "walk": "fnaf:walk",             ❌ Špatné
}
```

**Krok 3: Zkontroluj Animation Controllers**
```
Soubor: resource_pack/animation_controllers/fnaf.animation_controllers.json

Musí obsahovat:
- controller.animation.fnaf.daytime
- controller.animation.fnaf.nighttime
```

**Krok 4: Verifikace Struktury**
```
Správná struktura:
resource_pack/
├── animations/
│   └── fnaf.animations.json ✅
├── animation_controllers/
│   └── fnaf.animation_controllers.json ✅
└── entity/
    └── freddy.json ✅
```

---

## 💥 Animatroniky Neútočí (v Noci)

### Příznak
Je noc, ale animatroniky hráče nesledují a neútočí.

### Řešení

**Krok 1: Zkontroluj Game Time**
```
/time query daytime

Výstup:
- 0-13000 = DEN (showtime)
- 13001-23999 = NOC (love)

Pokud je špatný čas:
/time set 13000  (pro noc)
/time set 0      (pro den)
```

**Krok 2: Ověř, že je Nighttime Group Aktivní**
```
/execute as @e[family=freddy] run event entity @s fnaf:switch_to_nighttime

Nebo zkus manuálně přepnout všechny:
/event entity @e[family=fnaf] fnaf:switch_to_nighttime
```

**Krok 3: Zkontroluj Main Function**
```
Ověř, že běží repeat command block:
/function fnaf:main

Pokud ne, nastav:
- Command Block Type: Repeat
- Conditional: Off
- Redstone Required: Off
- Delay: 1 tick
```

**Krok 4: Zkontroluj Range**
```
Hráč musí být v dosahu:
- Freddy: 40 bloků
- Foxy: 45 bloků
- Golden Freddy: 50 bloků

Příkaz pro debug:
/execute as @e[family=fnaf] run say Pronásleduji!
```

**Krok 5: Zkontroluj Senzory**
```
V behavior_pack/entities/freddy.json:

"minecraft:behavior.nearest_prioritized_attackable_target": {
  "target_types": ["player", "villager"],  ✅
  "must_see": true,  // Entita musí vidět cíl
  "target_search_radius": 40
}
```

---

## 🧭 Animatroniky se Nedaří Teleportovat na Markery

### Příznak
V Daytime rezamu animatroniky zůstávají na místě a nechodí na markery.

### Řešení

**Krok 1: Ověř Markery Existují**
```
/execute as @e[name=marker_freddy] run say Marker existuje!

Pokud nic nezobrazí, markery neexistují.
```

**Krok 2: Vytvoř Markery se Správnými Názvy**
```
/summon fnaf:marker -100 64 -100 {"CustomName":"marker_freddy"}
/summon fnaf:marker -90 64 -100 {"CustomName":"marker_chica"}
/summon fnaf:marker -80 64 -100 {"CustomName":"marker_bonnie"}
/summon fnaf:marker -70 64 -100 {"CustomName":"marker_foxy"}
/summon fnaf:marker -60 64 -100 {"CustomName":"marker_golden_freddy"}
```

**Krok 3: Zkontroluj Funkci daytime_cycle.mcfunction**
```
Obsah by měl být:
/execute as @e[family=freddy] at @e[name=marker_freddy] run tp @s ~~0.5~

Pokud je špatně, oprav:
behavior_pack/functions/daytime_cycle.mcfunction
```

**Krok 4: Spusť Daytime Cyklus Manuálně**
```
/time set 0
/function fnaf:daytime_cycle

Animatroniky by měly skočit na markery.
```

**Krok 5: Zkontroluj Pokusy**
```
Debug: Obr se marker nachází:
/execute at @e[name=marker_freddy] run setblock ~ ~ ~ redstone_ore

Měl by se objevit redstone blok na místě markeru.
```

---

## 🔊 Zvuky se Nehrají

### Příznak
Animatroniky jsou vidět a animované, ale nevydávají zvuky.

### Poznámka
FNAF Mod zatím nemá implementovány zvuky. Chceš-li zvuky přidat, musíš:

1. Přidat sound definitions do `behavior_pack/sounds.json`
2. Přidat sound files do `resource_pack/sounds/[jméno].ogg`
3. Přidat event `fnaf:play_sound` do entity definice

---

## 🔋 Nízký Výkon / Lag

### Příznak
Hra se zatuhuje, FPS klesá když jsou animatroniky vidět.

### Řešení

**Krok 1: Snížit Počet Animatronů**
```
Bez optimalizace: 5 entit = 5 AI systémů
Řešení: Spawnuj jen některé
/kill @e[family=chica]
/kill @e[family=bonnie]
```

**Krok 2: Zvýšit Interval Main Funkce**
```
V Command Blocku nastavit:
Delay: 20 (místo 1)

Efekt: Funk se spustí jen 1x za sekundu
Výsledek: Méně výpočtů, ale pomalejší response
```

**Krok 3: Deaktivovat Nepotřebné Behavory**
```
V behavior_pack/entities/freddy.json:
"minecraft:behavior.random_stroll": {
  ... pro noc sniž speed_multiplier
}
```

**Krok 4: Nastavit Render Distance Limit**
```
View Distance: 12 (míst 32)
Pak nastavit Entity Distance: 8 (místo 16))
```

---

## 🎭 Špatné Animace v Daytime

### Příznak
Animatroniky v den hrají walkingové animace místo showtime.

### Řešení

**Krok 1: Zkontroluj Controller**
```
resource_pack/animation_controllers/fnaf.animation_controllers.json

Daytime controller musí mít:
"default": {
  "transitions": [
    { "idle": "query.is_moving == 0.0" },
    { "singing": "..." }
  ]
}
```

**Krok 2: Nastavit Speed Multiplier na 0**
```
behavior_pack/entities/freddy.json

V daytime component group:
"minecraft:behavior.random_stroll": {
  "speed_multiplier": 0.0  ✅ (Nula = bez pohybu)
}
```

---

## 📍 Chyba "Unknown Entity"

### Příznak
Příkaz `/summon fnaf:freddy` dává chybu: "Unknown entity"

### Řešení

**Krok 1: Ověř Manifest.json**
```
behavior_pack/manifest.json:
- format_version: 2 (musí být)
- uuid: (musí být jedinečný)
```

**Krok 2: Ověř Entity Identifier**
```
behavior_pack/entities/freddy.json:
"identifier": "fnaf:freddy"  ✅

Špatně:
"identifier": "freddy"  ❌
"identifier": "fnaf_freddy"  ❌
```

**Krok 3: Zkontroluj Registraci**
```
Behavior Pack:
- manifest.json ✅
- entities/ (složka) ✅
  - freddy.json ✅
```

**Krok 4: Reload a Zkus Znovu**
```
/reload
/summon fnaf:freddy ~ ~ ~
```

---

## 🎨 Textury se Nezobrazují (Fialový Checkerboard)

### Příznak
Animatroniky se zobrazují, ale mají fialový/černý checkerboard efekt.

### Řešení

**Krok 1: Ověř Textury Existují**
```
Správná cesta:
resource_pack/textures/entity/freddy.png ✅

Špatně:
resource_pack/textures/freddy.png ❌
resource_pack/textures/entity/freddy.jpg ❌
```

**Krok 2: Zkontroluj Jméno v Entity Definici**
```
resource_pack/entity/freddy.json:
"textures": {
  "default": "textures/entity/freddy"  ✅
}

Špatně:
"textures": {
  "default": "entity/freddy"  ❌
}
```

**Krok 3: Vytvoř PNG Textury**
```
Pokud textury neexistují:
1. Vytvoř 32x32 PNG soubory
2. Vyplň barvou (viz TEXTURY_A_MODELY.md)
3. Ulož s správným jménem
4. /reload
```

**Krok 4: Zkontroluj PNG Kvalitu**
```
Textury MUSÍ být:
- PNG (ne JPG, ne BMP)
- 32x32 pixelů
- S alpha kanálem (transparentní)
```

---

## 🔄 Cyklus Den/Noc se Nespouští

### Příznak
Čas se mění, ale animatroniky se neměnící chování (vždycky pasivní nebo vždycky agresivní).

### Řešení

**Krok 1: Zkontroluj Main Funkci**
```
Execute: /function fnaf:main
Mělo by vytisknout zprávu v chate.

Pokud ne, příkaz neexistuje nebo je špatně pojmenovaný.
```

**Krok 2: Ověř Time Queries**
```
behavior_pack/functions/main.mcfunction:
execute if time matches 0..100 run function fnaf:daytime_cycle
execute if time matches 13000 run function fnaf:nighttime_cycle
```

**Krok 3: Zkontroluj Component Group Přepínání**
```
nighttime_cycle.mcfunction by měl obsahovat:
event entity @e[family=freddy] fnaf:switch_to_nighttime
event entity @e[family=chica] fnaf:switch_to_nighttime
... (pro všechny entity)
```

---

## 📦 Mod se Neloaduje

### Příznak
Pack se neobjevuje v Manage Packs nebo zobrazuje chybu.

### Řešení

**Krok 1: Zkontroluj Strukturu**
```
Správná struktura:
behavior_pack/
├── manifest.json ✅
├── entities/
│   └── *.json ✅
├── functions/
│   └── *.mcfunction ✅
└── animations/
    └── *.json ✅

Pokud chybí manifest.json, pack se neloaduje!
```

**Krok 2: Zkontroluj Format Verze**
```
manifest.json:
"format_version": 2  ✅

Staré verze nebudou fungovat v novém Minecraftu.
```

**Krok 3: Zkontroluj JSON Syntax**
```
- Všechny složené závorky { } musí být párové
- Všechny hranaté závorky [ ] musí být párové
- Řetězce musí být v "úvozovkách"

Tools pro validaci:
- https://jsonlint.com/
```

**Krok 4: Zkontroluj Adresář**
```
Windows:
C:\Users\[User]\AppData\Local\Packages\...\behavior_packs\

Struktura:
behavior_packs/
└── FNAF-behavior-pack/
    ├── manifest.json ✅
    └── ... (ostatní soubory)
```

---

## 🆘 Další Problémy

Pokud tvůj problém není výše, zkus:

1. **Restart Hry** - Vypni a zapni Minecraft
2. **/reload** - Znovu načti packs
3. **Smaž Cache** - Smaž mojang data cache
4. **Zkontroluj Logech** - Podívej se do debug log

Debug log:
```
Windows: %APPDATA%\.minecraft\logs\
Mac: ~/Library/Application Support/minecraft/logs/
Linux: ~/.minecraft/logs/
```

---

**Řešení problémů FNAF Modu - hotovo! 🔧**
