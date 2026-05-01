# FNAF Mod - Průvodce nastavením

Podrobný průvodce pro nastavení a konfiguraci FNAF Modu v tvém Minecraft Bedrock světě.

## 1️⃣ Instalace Packů

### Krok 1: Umístění souborů

**Na Windows:**
```
C:\Users\[VášeJméno]\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\behavior_packs\
C:\Users\[VášeJméno]\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\resource_packs\
```

**Na macOS:**
```
~/Library/Application Support/minecraft/behavior_packs/
~/Library/Application Support/minecraft/resource_packs/
```

**Na Androidu:**
```
Games/com.mojang/behavior_packs/
Games/com.mojang/resource_packs/
```

### Krok 2: Zkopírování souborů

1. Zkopíruj `behavior_pack` → přejmenuj na `FNAF-behavior-pack`
2. Zkopíruj `resource_pack` → přejmenuj na `FNAF-resource-pack`
3. Umísti obě složky do příslušných adresářů

### Krok 3: Aktivace v hře

1. Otevři Minecraft Bedrock
2. Vytvoř nový svět nebo otevři existující
3. Jdi na **Nastavení světa** (World Settings)
4. Najdi **Behavior Packs** → přidej `FNAF-behavior-pack`
5. Najdi **Resource Packs** → přidej `FNAF-resource-pack`
6. Posuň oba na **začátek** seznamu priorit
7. Ulož a znovu načti svět

## 2️⃣ Inicializace Modu

### Krok 1: Aktivace příkazů

Spusť tyto příkazy v pořadí:

```
# 1. Aktivuj experimentální funkce (pokud není aktivováno)
/reload

# 2. Inicializuj scoreboaredy a nastavení
/function fnaf:setup

# 3. Vytvoř Markery (pozice, kde budou animatroniky stát během dne)
summon fnaf:marker -100 64 -100 {"CustomName":"marker_freddy"}
summon fnaf:marker -90 64 -100 {"CustomName":"marker_chica"}
summon fnaf:marker -80 64 -100 {"CustomName":"marker_bonnie"}
summon fnaf:marker -70 64 -100 {"CustomName":"marker_foxy"}
summon fnaf:marker -60 64 -100 {"CustomName":"marker_golden_freddy"}
```

### Krok 2: Spawnování animatronů

```
# Spawnuj všechny animatroniky v jednom místě
summon fnaf:freddy -85 64 -85
summon fnaf:chica -80 64 -85
summon fnaf:bonnie -75 64 -85
summon fnaf:foxy -70 64 -85
summon fnaf:golden_freddy -65 64 -85
```

### Krok 3: Aktivace hlavní funkce

Vytvoř **Repeat Command Block** a nastav:

**Command:**
```
/function fnaf:main
```

**Nastavení:**
- Delay: `1` tick
- Conditional: `OFF`
- Redstone Required: `OFF`

Alternativně spusť příkaz jednou:
```
/function fnaf:main
```

## 3️⃣ Konfigurační Příkazy

### Manipulace s Časem

```
# Nastavit den (showtime)
/time set 0

# Nastavit noc (lovecký režim)
/time set 13000

# Získat aktuální čas
/time query daytime
```

### Správa Animatronů

```
# Přepnout na noci režim (všichni)
/execute as @e[family=fnaf] run event entity @s fnaf:switch_to_nighttime

# Přepnout na denní režim (všichni)
/execute as @e[family=fnaf] run event entity @s fnaf:switch_to_daytime

# Zabít všechny animatroniky
/kill @e[family=fnaf]

# Počet aktivních animatronů
/execute as @e[family=fnaf] run say Jsem aktivní!
```

### Scoreboard Správa

```
# Zobrazit všechny objetivy
/scoreboard objectives list

# Zobrazit skóre pro konkrétní hráče
/scoreboard players list

# Resetovat skóre
/scoreboard objectives remove fnaf_time
/scoreboard objectives remove fnaf_showtime_type
/scoreboard objectives remove fnaf_day_night
```

## 4️⃣ Nastavení Showtime Typů

Během dne každý animatron hraje jinou showtime animaci:

```
# Nastavit showtime typ (1=zpěv, 2=tanec, 3=kytara)
/scoreboard players set freddy fnaf_showtime_type 1      # Zpěv
/scoreboard players set chica fnaf_showtime_type 2       # Tanec
/scoreboard players set bonnie fnaf_showtime_type 3      # Kytara
/scoreboard players set foxy fnaf_showtime_type 1        # Zpěv
/scoreboard players set golden_freddy fnaf_showtime_type 2 # Tanec
```

## 5️⃣ Pozice Markerů - Příklady

### Scénář 1: Malá Scéna
```
# Markery v řadě (pro malou scénu)
summon fnaf:marker -100 64 -100 {"CustomName":"marker_freddy"}
summon fnaf:marker -90 64 -100 {"CustomName":"marker_chica"}
summon fnaf:marker -80 64 -100 {"CustomName":"marker_bonnie"}
summon fnaf:marker -70 64 -100 {"CustomName":"marker_foxy"}
summon fnaf:marker -60 64 -100 {"CustomName":"marker_golden_freddy"}
```

### Scénář 2: Velká Scéna
```
# Markery v kruhu (pro větší scénu)
summon fnaf:marker -100 64 -100 {"CustomName":"marker_freddy"}
summon fnaf:marker -85 64 -115 {"CustomName":"marker_chica"}
summon fnaf:marker -70 64 -100 {"CustomName":"marker_bonnie"}
summon fnaf:marker -85 64 -85 {"CustomName":"marker_foxy"}
summon fnaf:marker -100 64 -115 {"CustomName":"marker_golden_freddy"}
```

### Scénář 3: Divadelní Scéna
```
# Markery simulující pódia (pro divadelní efekt)
summon fnaf:marker -100 65 -95 {"CustomName":"marker_freddy"}      # Střed
summon fnaf:marker -110 65 -95 {"CustomName":"marker_chica"}       # Vlevo
summon fnaf:marker -90 65 -95 {"CustomName":"marker_bonnie"}       # Vpravo
summon fnaf:marker -110 65 -100 {"CustomName":"marker_foxy"}       # Vlevo-Dole
summon fnaf:marker -90 65 -100 {"CustomName":"marker_golden_freddy"} # Vpravo-Dole
```

## 6️⃣ Optimalizace Výkonu

### Znížení Počtu Entit

Pokud máš problémy s výkonem:

```
# Spawnuj jen některé animatroniky
summon fnaf:freddy ~ ~ ~
summon fnaf:foxy ~ ~ ~
summon fnaf:golden_freddy ~ ~ ~

# Odstrani ostatní
/execute as @e[family=chica] run kill @s
/execute as @e[family=bonnie] run kill @s
```

### Vyladění Command Blocku

Pokud jsi limitován výkonem:

```
# Spusť main funkci jen jednou za X ticků (např. 10)
# Nastav delay v command blocku na: 10
/function fnaf:main
```

## 7️⃣ Databáze Svačů

Když chceš změnit specifikace animatronů, edituj tyto soubory:

### Health (Zdraví)
- `behavior_pack/entities/freddy.json` → `minecraft:health.value`
- Výchozí hodnoty: 45-60

### Speed (Rychlost)
- `behavior_pack/entities/[animatron].json` → `behavior.pursue_target.speed_multiplier`
- Výchozí: 0.5-0.8 (v noci)

### Range Pronásledování
- `behavior_pack/entities/[animatron].json` → `behavior.pursue_target.within_radius`
- Výchozí: 35-50 bloků

## 8️⃣ Řešení Problémů

### Animatroniky se nevyzívají
- Zkontroluj, zda mají Markery správná jména
- Přetvořit command: `scoreboard objectives remove fnaf_day_night`
- Spusť: `function fnaf:setup` znovu

### Nefungují animace
- Aktivuj Resource Pack v Nastavení Světa
- Zkontroluj pořadí: Resource Pack musí být **VPRAVO**
- Zkus `/reload`

### Animatroniky neútočí
- Zkontroluj čas: `/time set 13000`
- Spusť: `event entity @e[family=fnaf] fnaf:switch_to_nighttime`
- Ověř, zda jsou hráči v rozsahu (check range)

### Vysoké CPU využití
- Sniž `speed_multiplier` v entitních souborech
- Spusť main funkci s delší prodlevou
- Spawnuj méně animatronů

---

## ✅ Kontrolní Seznamem Nastavení

- [ ] Behavior Pack umístěn a aktivován
- [ ] Resource Pack umístěn a aktivován
- [ ] Oba packs jsou na začátku seznamu priorit
- [ ] Spuštěn `fnaf:setup`
- [ ] Vytvořeni Markery s správnými názvy
- [ ] Spawnuti animatroniky
- [ ] Nastaven Repeat Command Block pro `fnaf:main`
- [ ] Testován den/noc cyklus
- [ ] Ověřeny animace a chování

**Vše je hotovo! Užij si FNAF Mod! 🎃👻**
