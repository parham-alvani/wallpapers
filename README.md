# Wallpapers 📷

## Introduction

These are the pictures of me and my wife (Elahe) that we use as our system background images. On Arch, I use [feh](https://github.com/derf/feh) and I only need to clone this into `~/Pictures/Gosimac`.

All images live in [`normalized/`](normalized/), cropped to a uniform **2560×1664** so they fill the screen edge-to-edge.

## macOS rotating collection

On macOS this folder doubles as a rotating wallpaper *collection*, driven by a `launchd` agent (no App Store app needed):

```bash
./wallpaper-collection.sh install        # rotate hourly + at every login
./wallpaper-collection.sh install 900    # or every 15 minutes
./wallpaper-collection.sh next           # jump to a new random image now
./wallpaper-collection.sh uninstall      # stop and remove the agent
```

| File | Purpose |
| --- | --- |
| [`wallpaper-collection.sh`](wallpaper-collection.sh) | Installs the `launchd` agent and sets a random wallpaper from `normalized/`. |
| [`normalize.sh`](normalize.sh) | Crop-to-fill new images to 2560×1664 into `normalized/` (re-runnable). |
| [`com.parham.wallpaper-collection.plist`](com.parham.wallpaper-collection.plist) | Reference copy of the generated `launchd` agent. |

After adding new photos: `./normalize.sh` then they join the rotation automatically.

## Where these were taken

Locations were read from each photo's GPS EXIF and reverse-geocoded via [OpenStreetMap Nominatim](https://nominatim.org/). 48 of 77 images carried GPS data. Entries marked _(approx.)_ are city/province-level estimates derived from the coordinates (Nominatim rate-limited those points), not precise neighbourhoods.

### Velenjak, Tehran, Iran  ·  7
`20210527_155318.jpg`, `20210609_132536.jpg`, `20210609_132620.jpg`, `20210609_141249.jpg`, `20211021_130049_07.jpg`, `20231011_122513.jpg`, `20231011_124637.jpg`

### Sarv Azad, Tehran, Iran  ·  6
`20220330_175300.jpg`, `20221027_205004.jpg`, `20230119_163431.jpg`, `20230409_180316.jpg`, `20230912_175650.jpg`, `IMG_20220112_215331_428.jpg`

### Derakhti, Tehran, Iran  ·  5
`20230513_161442.jpg`, `20230513_161550.jpg`, `20230722_162410.jpg`, `IMG_20230722_161817082.jpg`, `IMG_20230729_153259018.jpg`

### Qā'em, Tehran, Iran  ·  4
`20210128_131825.jpg`, `20220926_170756.jpg`, `20220926_170802.jpg`, `lock.jpg`

### Al Wohoosh, Dubai Emirate, United Arab Emirates  ·  3
`IMG_0139.jpg`, `IMG_0140.jpg`, `IMG_0141.jpg`

### Tehran, Iran (approx.)  ·  3
`20200229_123238.jpg`, `20231125_124832.jpg`, `IMG_1712.jpg`

### Mehran, Tehran, Iran  ·  2
`20200222_193444.jpg`, `20220615_202141.jpg`

### Sheikh Hadi, Tehran, Iran  ·  2
`20220914_134117.jpg`, `IMG-0096.jpg`

### Vanak, Tehran, Iran  ·  2
`IMG_1672.jpg`, `Project Bax.jpg`

### Al Dafain, Al Madam, United Arab Emirates  ·  1
`IMG_0138.jpg`

### Al Satwa, Dubai, United Arab Emirates  ·  1
`IMG_0142.jpg`

### Alborz Province — near Karaj, Iran (approx.)  ·  1
`IMG_20230629_132830642.jpg`

### Ararat, Tehran, Iran  ·  1
`20210527_155417.jpg`

### District 22, Tehran, Iran  ·  1
`IMG_0263.jpg`

### Ferdowsi, Tehran, Iran  ·  1
`IMG_20190425_115936.jpg`

### Gheytarieh, Tehran, Iran  ·  1
`20200220_200409.jpg`

### Jordan - Park Melat, Tehran, Iran  ·  1
`IMG_0002.jpg`

### Morad Abad, Tehran, Iran  ·  1
`20230513_181246.jpg`

### Parvaz, Tehran, Iran  ·  1
`20190402_132159.jpg`

### Qoreyshi, Fardis County, Iran  ·  1
`20230520_165039.jpg`

### Shahrak e Naz, Fardis County, Iran  ·  1
`20220916_151055.jpg`

### Tehran Province — east of Tehran, Iran (approx.)  ·  1
`20220916_134225.jpg`

### Zabeel, Dubai, United Arab Emirates  ·  1
`IMG_0143.jpg`

### Location unknown  ·  29
No GPS data in these images.

`1688037514061.jpg`, `20200318_131214.jpg`, `20200507_091259.jpg`, `20200513_162328.jpg`, `20200513_162353.jpg`, `20200521_144453.jpg`, `20200530_183655.jpg`, `20210128_112217.jpg`, `20210128_113531.jpg`, `20220209_160724.jpg`, `20220418_165819.jpg`, `20221023_124827.jpg`, `20221215_163344.jpg`, `20221220_135038.jpg`, `20221220_140131.jpg`, `20221220_154926.jpg`, `20230312_115719.jpg`, `20230323_152611.jpg`, `20230424_130611.jpg`, `DSC00003.jpg`, `IMG_20230102_192526_277.jpg`, `IMG_20230316_001748_648.jpg`, `IMG_20230524_115654_383.jpg`, `IMG_20230624_144704_350.jpg`, `IMG_20230912_170449028.jpg`, `SAM_0548.jpg`, `photo_2020-08-21_00-56-16.jpg`, `photo_2023-01-16_20-23-13.jpg`, `photo_2023-01-16_20-23-16.jpg`
