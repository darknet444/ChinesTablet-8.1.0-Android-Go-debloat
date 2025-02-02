# Chinese Tablet 8.1.0 Android Go Debloat Script

Dit script helpt je om je Chinese Tablet met Android 8.1.0 Go te ontdoen van onnodige applicaties (debloat).

## Stappen

### Stap 1: Activeer Ontwikkelaarsopties
Ga naar `Instellingen -> Over de telefoon` en druk 5 keer op het buildnummer.

### Stap 2: Schakel USB-foutopsporing in
Ga naar `Instellingen -> Ontwikkelaarsopties` en schakel `USB-debugging` in.

### Stap 3: Installeer Git, Curl en ADB
Installeer de benodigde tools afhankelijk van je besturingssysteem:

- **Debian-gebaseerd:**
    ```sh
    sudo apt-get install wget git adb
    ```
- **Redhat-gebaseerd:**
    ```sh
    sudo dnf install wget git adb
    ```
- **Arch-gebaseerd:**
    ```sh
    sudo pacman -S wget git adb
    ```

### Stap 4: Clone de Repository
Clone de repository met het volgende commando:
```sh
git clone https://github.com/darknet444/ChinesTablet-8.1.0-Android-Go-debloat.git

### Stap 5: Maak het Script Uitvoerbaar
```sh
chmod +x ChinesTablet-8.1.0-Android-Go-debloat/Debloat.sh
```
### Stap 6: Voer het Script uit
```sh
./ChinesTablet-8.1.0-Android-Go-debloat/Debloat.sh
```
