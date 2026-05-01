# Pokyn pro vytvoření Textur - Placeholder

Toto jsou pokyny pro vytvoření placeholder textur pro všechny animatroniky. Textury jsou 32x32 pixelů ve formátu PNG.

## Vytvoření Placeholder Textur

Pokud zatím nemáš vlastní textury, můžeš vytvořit jednoduché placeholder barvy:

### Metoda 1: Používání Online Nástrojů

1. Jdi na https://www.piskelapp.com/ nebo https://www.aseprite.org/
2. Vytvoř nový projekt: 32x32 pixelů
3. Vyplň barvu pro každého animatrona:
   - **Freddy**: Hnědá (#3D2817)
   - **Chica**: Žlutá (#FFD700)
   - **Bonnie**: Purpurová (#9932CC)
   - **Foxy**: Rudá (#8B0000)
   - **Golden Freddy**: Zlatá (#FFD700)
4. Export jako PNG

### Metoda 2: Program Paint.NET

1. Otevři Paint.NET
2. Vytvoř nový obrázek: 32x32
3. Vyplň jednou barvou (pozadí na transparentní)
4. Ulož jako PNG

### Metoda 3: Minecraft Textury

Alternativně můžeš vzít existující Minecraft textury (např. Golems) a upravit je.

## Soubory k Vytvoření

Všechny textury umísti v:
```
resource_pack/textures/entity/
```

Potřebné soubory:
- [ ] freddy.png (32x32 hnědý)
- [ ] chica.png (32x32 žlutý)
- [ ] bonnie.png (32x32 purpurový)
- [ ] foxy.png (32x32 rudý)
- [ ] golden_freddy.png (32x32 zlatý)

## Barvy Referenční

RGB Kódy pro přesné barvy:

```
Freddy:      R:61  G:40  B:23   (Tmavá Hnědá)
Chica:       R:255 G:215 B:0    (Zlatá/Žlutá)
Bonnie:      R:153 G:50  B:204  (Purpurová)
Foxy:        R:139 G:0   B:0    (Tmavě Rudá)
Golden Fred: R:255 G:215 B:0    (Zlatá)
```

## Jednoduchý Postup - Pixelart

1. **Vytvoř plochu**: 32x32
2. **Vyplň tělo**: Střed 8x12 pixelů
3. **Přidej hlavu**: Vršek 10x10 pixelů
4. **Přidej údaje**: Oči, pupeee, detaily
5. **Ulož PNG**: Jméno by mělo odpovídat entitě

## Speciální Efekt - Glow

Pokud chceš "svítící" efekt, přidej:
- Lehký rámeček v jasnější barvě
- Bílý nebo světlý lesk na očích

## Poznámka o Kompatibilitě

Textury **MUSÍ** být:
- ✅ PNG formát (s alpha kanálem)
- ✅ 32x32 pixelů
- ✅ Umístěny v `resource_pack/textures/entity/`
- ✅ Pojmenované: `[animatron].png`

Pokud jsou textury chybějící, bude se místo nich zobrazovat purpurový/černý checkerboard.

---

Pro detailnější pokyny k tvorbě textur viz: `TEXTURY_A_MODELY.md`
