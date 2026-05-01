# FNAF Mod - Rychlý Start

Nejrychlejší cesta ke spuštění FNAF Modu - stačí 5 minut!

## ⚡ Super Rychlý Start (5 minut)

### Krok 1: Stáhnutí Souborů (30 sekund)
```
Stáhni FNAF-mod ze GitHubu
```

### Krok 2: Kopírování Packů (1 minuta)
**Windows:**
```
1. Otevři File Explorer
2. Jdi na: C:\Users\[TvůjNázev]\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\

3. Zkopíruj:
   - behavior_pack → behavior_packs/FNAF-behavior-pack/
   - resource_pack → resource_packs/FNAF-resource-pack/
```

**Keyboard Shortcut:**
```
Win + R → mmc → OK → (soubory se otevřou)
```

### Krok 3: Aktivace v Minecraftu (2 minuty)
```
1. Otevři Minecraft Bedrock
2. Vytvoř NOVÝ SVĚT
3. Jdi na: Nastavení Světa → Behavior Packs
4. Přidej: FNAF-behavior-pack
5. Jdi na: Resource Packs
6. Přidej: FNAF-resource-pack
7. Přesuň oba NA ZAČÁTEK
8. Ulož a načti svět
```

### Krok 4: Spuštění (1 minuta)
```
Otevři Chat (T) a piš:
/function fnaf:setup
```

Po zprávě "done" napiš:
```
summon fnaf:freddy
```

Hotovo! ✅

---

## 🎮 Základní Příkazy

### Spawnování
```
/summon fnaf:freddy         # Freddy
/summon fnaf:chica          # Chica
/summon fnaf:bonnie         # Bonnie
/summon fnaf:foxy           # Foxy
/summon fnaf:golden_freddy  # Golden Freddy
```

### Čas
```
/time set 0      # DEN (showtime) ☀️
/time set 13000  # NOC (lov)      🌙
```

### Smazání
```
/kill @e[family=fnaf]  # Smaž všechny
```

---

## 🌙 Den vs Noc

### DEN (0:00-13:00) ☀️
- Animatroniky hrají showtime
- Zpívání 🎤, tanec 💃, kytara 🎸
- Stojí na místě
- Nejsou nebezpečné

**Jak nastavit den:**
```
/time set 0
```

### NOC (13:00-23:59) 🌙
- Aktivuje se AI pronásledování
- Útočí na hráče! 💥
- Robotická, strašidelná chůze
- Nejsilnější je Golden Freddy

**Jak nastavit noc:**
```
/time set 13000
```

---

## 🏰 Vytvoření Showtime Scény

### Nejjednoduší Setup

```
1. Vytvoř nový svět
2. Aktivuj packs (viz Krok 3 výše)
3. /function fnaf:setup
4. /time set 0
5. Spawnuj animatroniky:
   /summon fnaf:freddy 0 64 0
   /summon fnaf:chica 5 64 0
   /summon fnaf:bonnie 10 64 0
   /summon fnaf:foxy 15 64 0
   /summon fnaf:golden_freddy 20 64 0
6. Sleduj showtime! 🎉
```

---

## 🔴 Noc - Lov Hráče

```
1. /time set 13000  (Aktivuj noc)
2. Animatroniky budou pronásledovat jakéhokoliv hráče
3. Budou útočit když se přiblížíš! 💢
4. Snažit se přežít! 🏃
```

---

## 🐛 Pokud Něco Nefunguje

### Animatroniky se neobjevují
```
Řešení:
1. /reload
2. /function fnaf:setup
3. /summon fnaf:freddy
```

### Nemají tváře/textury (fialový checkerboard)
```
= Textury zatím nejsou vytvořeny
= To je OK, model je tam, jen bez barvy
= Textury lze přidat později
```

### Neútočí v noci
```
1. /time query daytime  (zkontroluj čas)
2. /time set 13000      (nastav noc)
3. Chvíli čekej
```

---

## 📝 Doplňující Pokyny

### Pokročilejší Setup - Arena

```
# Vytvoř showtime markery (kde budou stát během dne)
/summon fnaf:marker 0 64 0 {"CustomName":"marker_freddy"}
/summon fnaf:marker 5 64 0 {"CustomName":"marker_chica"}
/summon fnaf:marker 10 64 0 {"CustomName":"marker_bonnie"}
/summon fnaf:marker 15 64 0 {"CustomName":"marker_foxy"}
/summon fnaf:marker 20 64 0 {"CustomName":"marker_golden_freddy"}

# Spawnuj animatroniky
/summon fnaf:freddy
/summon fnaf:chica
/summon fnaf:bonnie
/summon fnaf:foxy
/summon fnaf:golden_freddy

# Aktivuj day cycle
/function fnaf:daytime_cycle

# Animatroniky by měly skočit na markery!
```

### Aktivace Automatického Cyklu

Chceš-li aby se den/noc měnil automaticky:

```
1. Vytvoř COMMAND BLOCK (pravý klik na vzduch v Creative módu)
2. Počet kliknutí: 1
3. Nastav na REPEAT
4. Zadej příkaz: /function fnaf:main
5. DONE
6. Nyní se cyklus spouští automaticky!
```

---

## 🎨 Textury (Nepovinné)

Animatroniky jsou nyní fialové (placeholder).

Chceš-li pěkné textury:

1. Jdi do: `resource_pack/textures/entity/`
2. Vytvoř 5 PNG obrázků (32x32 pixelů):
   - freddy.png (hnědý)
   - chica.png (žlutý)
   - bonnie.png (purpurový)
   - foxy.png (rudý)
   - golden_freddy.png (zlatý)
3. Ulož je tam
4. `/reload`

ℹ️ Bez textur to pořád funguje, jen bez barev!

---

## 🎯 Speciální Efekty

### Showtime Typy (během dne)

Každý animatron hraje jinou animaci:

```
Freddy    = Zpěv       🎤
Chica     = Tanec      💃
Bonnie    = Kytara     🎸
Foxy      = Zpěv       🎤
G. Freddy = Tanec      💃
```

(Automaticky se přehrává, nic nemusíš dělat)

### Attack Sound (noc)

Když se animatron přiblíží:
- Vydá zvuk útoku (pokud je zvuk nainstalovám)
- Zahraje attack animaci
- Bude tě pronásledovat

---

## 📱 Příkazy Cheat Sheet

| Příkaz | Efekt |
|--------|-------|
| `/function fnaf:setup` | Inicializuj |
| `/time set 0` | Den |
| `/time set 13000` | Noc |
| `/summon fnaf:freddy` | Spawn Freddy |
| `/kill @e[family=fnaf]` | Smaž všechny |
| `/reload` | Restart |

---

## ✅ Kontrola - Vše Funguje?

Spusť tuto sekvenci:

```
1. /function fnaf:setup
   ✓ Měl by napsat "done" 3x

2. /summon fnaf:freddy
   ✓ Měla by se objevit entita

3. /time set 0
   ✓ Měl by být den

4. /time set 13000
   ✓ Měl by být noc
   ✓ Animatron by měl začít pronásledovat
```

Pokud všechno funguje → **Gratuluji!** 🎉

---

## 🆘 Emergency Troubleshooting

**Nic nefunguje:**
```
1. Smaž svět
2. Vytvoř NOVÝ svět
3. Jdi krok po kroku znovu
4. Zkus: /reload
```

**Textury jsou fialové:**
```
= NormálnÍ! Textury zahrnují. Není co řešit.
```

**Laguje:**
```
1. Spawnuj méně animatronů
2. Sniž View Distance na 12
3. Zkus jen 2-3 animatroniky
```

**Animatroniky se neteleportují:**
```
= Markery neexistují nebo mají špatná jména
= To je OK, fungovat to stejně bude, jen se neteleportují
```

---

## 🎓 Další Kroky

Když to funguje:

1. 📖 Čti **PRUVODCE_NASTAVENIM.md** pro pokročilé nastavení
2. 🎨 Čti **TEXTURY_A_MODELY.md** pro vytvoření textur
3. 🔧 Čti **ARCHITEKTURA.md** pro technické detaily
4. 🐛 Čti **RESENI_PROBLEMU.md** pokud něco nejde

---

## 🎉 Hotovo!

Teď si užívej FNAF v Minecraftu!

**Vítej v Freddy Fazbear's Pizzerii! 🍕👻**

---

*Potřebuješ pomoc? Jdi na RESENI_PROBLEMU.md*
