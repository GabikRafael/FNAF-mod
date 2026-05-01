# Textury a modely - Návod

Tento dokument vysvětluje, jak vytvořit textury a modely pro FNAF Mod.

## Textury

Všechny textury musí být uloženy v:
```
resource_pack/textures/entity/
```

### Velikost textur
- **Je 32x32 pixelů** (standardní pro Minecraft entity)
- Formát: PNG s transparencí

### Textury entit

#### 1. freddy.png (Hnědý medvěd)
- **Barva**: Tmavě hnědá (#6B4423)
- **Vlnitá**: Crème hlasitostní (#C49A6C)
- **Oči**: Černé s bílým leskem
- **Design**: Klasický medvěd s cylindrem
- **Detaily**: Knoflíky na těle, kravata

#### 2. chica.png (Žlutá kuřka)
- **Barva**: Žlutá (#FFD700)
- **Hlasitost**: Oranžová (#FF8C00)
- **Oči**: Černé s bílým leskem
- **Design**: Kuřka s tváří
- **Detaily**: Zobák, piórka, kuřecí tvar

#### 3. bonnie.png (Purpurový králík)
- **Barva**: Purpurová (#8B008B)
- **Hlasitost**: Světlejší purpurová (#DA70D6)
- **Oči**: Černé s bílým leskem
- **Design**: Králik v kapele
- **Detaily**: Dlouhé uši, kytara

#### 4. foxy.png (Rudá liska)
- **Barva**: Tmavě rudá (#8B0000)
- **Hlasitost**: Rudá (#FF0000)
- **Oči**: Černé s bílým leskem
- **Design**: Pirátská liska
- **Detaily**: Zlatý hák, pirátský klobouk, záplata na oku

#### 5. golden_freddy.png (Zlatý medvěd)
- **Barva**: Zlatá (#FFD700)
- **Hlasitost**: Tmavě zlatá (#DAA520)
- **Oči**: Černé s žlutým leskem
- **Design**: Luxusní verze Freddy
- **Detaily**: Zlaté knoflíky, vzorovaná kravata, třpyt

## Modely (Blockbench)

### Jak importovat modely do Blockbenche

1. Otevři Blockbench
2. Klikni na "Open" a vyber `.json` soubor z `models/entity/`
3. Modely se importují jako "Java Block Models"

### Struktura modelu

Každý animatron se skládá z těchto částí (bones):

- **body** - Tělo (8x12 pixelů - 0.6 bloků šířka)
- **head** - Hlava (10x10 pixelů - 1 blok)
- **left_arm** - Levá ruka
- **right_arm** - Pravá ruka
- **left_leg** - Levá noha
- **right_leg** - Pravá noha

### Přizpůsobení modelů

Všechny modely jsou vytvořeny v Blockbenche v krychlovém stylu (blocky style). Pokud chceš:

1. **Změnit tvar**: Edituj velikost boxů v Blockbenche
2. **Přidat detaily**: Přidej nové boxy (např. pro cylindr Freddy)
3. **Zmenšit/Zvětšit**: Změň hodnoty "from" a "to" v JSON

### Příklad - Přidání cylindru k Freddy

```json
{
  "name": "cylinder",
  "from": [2.5, 27, 7.5],
  "to": [13.5, 31, 8.5],
  "faces": {
    "north": { "uv": [0, 0, 11, 4], "texture": "#freddy" },
    "south": { "uv": [0, 0, 11, 4], "texture": "#freddy" },
    "east": { "uv": [0, 0, 1, 4], "texture": "#freddy" },
    "west": { "uv": [0, 0, 1, 4], "texture": "#freddy" },
    "up": { "uv": [0, 0, 11, 1], "texture": "#freddy" }
  }
}
```

## Animace

Animace jsou definovány v JSON formátu. Viz `animations/fnaf.animations.json`

### Vytvoření vlastní animace v Blockbenche

1. Otevři Blockbench s modelem
2. Jdi do "Animate" taby
3. Klikni na "New Animation"
4. Pojmenuj ji (např. `animation.fnaf.custom`)
5. Vytvoř keyframes pro jednotlivé bony
6. Exportuj jako JSON

## Textury - Vytvoření v Painteru

### Postup:

1. Otevři Paint.NET nebo Photoshop
2. Vytvoř nový obrázek: **32x32 pixelů**
3. Nastav pozadí na **transparentní** (PNG s alfou)
4. Nakresli tělo animatrona podle specifikace
5. Ulož jako PNG v `resource_pack/textures/entity/`

### Tipy:

- Používej **pixelart** styl
- Vlasy/tvar: 8-12 pixelů
- Tělo: 6-10 pixelů
- Oči: 2-3 pixely
- Detaily: 1-2 pixely

### Příklad rozložení textury (32x32):

```
┌─────────────────────────────────┐
│         HLAVA (10x10)           │ 0-12
├─────────────────────────────────┤
│      TĚLO (8x12)                │ 12-24
├──────────┬──────────────────────┤
│ LEVÁ   │ PRAVÁ RUK (4x8 ea.)   │ 24-32
│ NOHA   │                        │
└─────────────────────────────────┘
   (4x8) (8x8 each)
```

## Soubory k edici

### Primárně:
- `resource_pack/textures/entity/freddy.png`
- `resource_pack/textures/entity/chica.png`
- `resource_pack/textures/entity/bonnie.png`
- `resource_pack/textures/entity/foxy.png`
- `resource_pack/textures/entity/golden_freddy.png`

### Sekundárně (pro pokročilé):
- `resource_pack/models/entity/[animatron].json` - Úprava tvaru
- `resource_pack/animations/fnaf.animations.json` - Nové animace

## Ověřování

Po vytvoření textur a modelů:

1. Zkopíruj oba packs do Minecraftu
2. Spusť hru a aktivuj packs
3. Spawnuj entity: `/summon fnaf:freddy`
4. Zkontroluj, zda se zobrazují správně

## Problémy a řešení

**Textura se nezobrazuje:**
- Zkontroluj cestu: `textures/entity/[jméno].png`
- Ujisti se, že PNG je správný formát
- Zkontroluj barvu a průhlednost

**Model vypadá divně:**
- Zkontroluj souřadnice boxů v JSON
- Ověř, že Model je správně spojen (parent-child relace)

**Animace se nehraje:**
- Zkontroluj název v `animation_controllers`
- Ověř formát JSON v animacích

---

**Pokyny pro textury a modely hotovy! Vychutnej si tvorbu! 🎨**
