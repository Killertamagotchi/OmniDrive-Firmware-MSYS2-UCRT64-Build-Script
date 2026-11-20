# OmniDrive Firmware – MSYS2 / UCRT64 Build Script

[🇺🇸 English](#english) | [🇩🇪 Deutsch](#deutsch)

---

<a name="english"></a>
## 🇺🇸 English

A small helper script (available in English and German) to easily compile the **[OmniDrive](https://github.com/RibShark/OmniDrive)** firmware on Windows using the **MSYS2 / UCRT64** environment.

### 📂 Included Files

* `Run_Build_Omnidrive_(EN).bat` – Windows batch starter (English) that automatically launches the MSYS2/UCRT64 environment and executes the build script.
* `build_omnidrive_EN.sh` – Shell script (English) that installs dependencies, clones the required repositories automatically, and compiles the firmware.
* `Run_Build_Omnidrive_(DE).bat` – Windows batch starter (German).
* `build_omnidrive_DE.sh` – Shell script (German).

### 📋 Prerequisites

* **Windows 10 / 11**
* **[MSYS2](https://msys2.org)** installed (default path `C:\msys64` is recommended).
* Stock firmware files (`HL-DT-ST_BD-RE_BU40N_1.00.bin` / `ASUS_BW-16D1HT_3.02.bin` – see the [OmniDrive repository](https://github.com) for required filenames and checksums).

### 🚀 Usage

1. Download or clone this repository into your desired working directory:
   ```bash
   git clone https://github.com
   ```
2. Double-click **`Run_Build_Omnidrive_(EN).bat`**.
3. Follow the on-screen instructions in the terminal window. The script will automatically clone and build all required sources.

*(Alternatively, you can open the **MSYS2 UCRT64** terminal manually, navigate to the folder, and run `./build_omnidrive_EN.sh`.)*

### 🔗 Sources & Credits

Although this build script clones the required repositories automatically, here are the links to the upstream projects:

* **[RibShark/OmniDrive](https://github.com/RibShark/OmniDrive)** – Custom firmware for MediaTek MT1959-based optical disc drives (`https://github.com/RibShark/OmniDrive.git`).
* **[Kingcom/armips](https://github.com/Kingcom/armips)** – Assembler for ARM and MIPS platforms required to build OmniDrive (`https://github.com/Kingcom/armips.git`).

---

<a name="deutsch"></a>
## 🇩🇪 Deutsch

Ein kleines Hilfsskript (verfügbar auf Deutsch und Englisch), um die **[OmniDrive](https://github.com/RibShark/OmniDrive)**-Firmware unter Windows einfach über die **MSYS2 / UCRT64**-Umgebung zu kompilieren.

### 📂 Enthaltene Dateien

* `Run_Build_Omnidrive_(DE).bat` – Windows-Batch-Starter (Deutsch), der automatisch die MSYS2/UCRT64-Umgebung startet und das Build-Skript ausführt.
* `build_omnidrive_DE.sh` – Shell-Skript (Deutsch), das benötigte Pakete einrichtet, die erforderlichen Repositories automatisch klont und die Firmware kompiliert.
* `Run_Build_Omnidrive_(EN).bat` – Windows-Batch-Starter (Englisch).
* `build_omnidrive_EN.sh` – Shell-Skript (Englisch).

### 📋 Voraussetzungen

* **Windows 10 / 11**
* **[MSYS2](https://msys2.org)** installiert (der Standardpfad `C:\msys64` wird empfohlen).
* Originale Stock-Firmware-Dateien (`HL-DT-ST_BD-RE_BU40N_1.00.bin` / `ASUS_BW-16D1HT_3.02.bin` – genaue Dateinamen und Prüfsummen findest du im [OmniDrive-Repository](https://github.com)).

### 🚀 Verwendung

1. Lade dieses Repository herunter oder klone es in ein beliebiges Arbeitsverzeichnis:
   ```bash
   git clone https://github.com
   ```
2. Starte die Datei **`Run_Build_Omnidrive_(DE).bat`** per Doppelklick.
3. Folge den Anweisungen im Terminalfenster. Das Skript klont und kompiliert alle benötigten Quellen automatisch.

*(Alternativ kannst du das **MSYS2 UCRT64**-Terminal manuell öffnen, in den Projektordner wechseln und `./build_omnidrive_DE.sh` ausführen.)*

### 🔗 Quellen & Verwendete Projekte

Auch wenn dieses Skript alle benötigten Projekte automatisch klont, sind hier die Direktlinks zu den zugrunde liegenden Repositories:

* **[RibShark/OmniDrive](https://github.com/RibShark/OmniDrive)** – Custom-Firmware für optische Laufwerke auf Basis des MediaTek MT1959 (`https://github.com/RibShark/OmniDrive.git`).
* **[Kingcom/armips](https://github.com/Kingcom/armips)** – Assembler für ARM- und MIPS-Plattformen, der zum Kompilieren von OmniDrive benötigt wird (`https://github.com/Kingcom/armips.git`).
