# OmniDrive Firmware – MSYS2 / UCRT64 Build Script

[🇺🇸 English](#english) | [🇩🇪 Deutsch](#deutsch)

---

<a name="english"></a>
## 🇺🇸 English

A small helper script (available in English and German) to easily compile the **OmniDrive firmware** on Windows using the **MSYS2 / UCRT64** environment.

### 📂 Included Files

* `Run_Build_Omnidrive_(EN).bat` – Windows batch starter (English) that automatically launches the MSYS2/UCRT64 environment and executes the build script.
* `build_omnidrive_EN.sh` – Shell script (English) that handles dependencies and compiles the firmware.
* `Run_Build_Omnidrive_(DE).bat` – Windows batch starter (German).
* `build_omnidrive_DE.sh` – Shell script (German).

### 📋 Prerequisites

* **Windows 10 / 11**
* **[MSYS2](https://msys2.org)** installed (default path `C:\msys64` is recommended).

### 🚀 Usage

1. Download or clone this repository into your desired working directory:
   ```bash
   git clone https://github.com
   ```
2. Double-click **`Run_Build_Omnidrive_(EN).bat`**.
3. Follow the on-screen instructions in the terminal window.

*(Alternatively, you can open the **MSYS2 UCRT64** terminal manually, navigate to the folder, and run `./build_omnidrive_EN.sh`.)*

---

<a name="deutsch"></a>
## 🇩🇪 Deutsch

Ein kleines Hilfsskript (verfügbar auf Deutsch und Englisch), um die **OmniDrive-Firmware** unter Windows einfach über die **MSYS2 / UCRT64**-Umgebung zu kompilieren.

### 📂 Enthaltene Dateien

* `Run_Build_Omnidrive_(DE).bat` – Windows-Batch-Starter (Deutsch), der automatisch die MSYS2/UCRT64-Umgebung startet und das Build-Skript ausführt.
* `build_omnidrive_DE.sh` – Shell-Skript (Deutsch), das benötigte Pakete einrichtet und die Firmware kompiliert.
* `Run_Build_Omnidrive_(EN).bat` – Windows-Batch-Starter (Englisch).
* `build_omnidrive_EN.sh` – Shell-Skript (Englisch).

### 📋 Voraussetzungen

* **Windows 10 / 11**
* **[MSYS2](https://msys2.org)** installiert (der Standardpfad `C:\msys64` wird empfohlen).

### 🚀 Verwendung

1. Lade dieses Repository herunter oder klone es in ein beliebiges Arbeitsverzeichnis:
   ```bash
   git clone https://github.com
   ```
2. Starte die Datei **`Run_Build_Omnidrive_(DE).bat`** per Doppelklick.
3. Folge den Anweisungen im Terminalfenster.

*(Alternativ kannst du das **MSYS2 UCRT64**-Terminal manuell öffnen, in den Projektordner wechseln und `./build_omnidrive_DE.sh` ausführen.)*
