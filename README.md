# OmniDrive Firmware – MSYS2 / UCRT64 Build Script

[🇺🇸 English](#english) | [🇩🇪 Deutsch](#deutsch)

---

<a name="english"></a>
## 🇺🇸 English

A small helper script (available in English and German) to easily compile the **[OmniDrive](https://github.com/RibShark/OmniDrive.git)** firmware on Windows using the **MSYS2 / UCRT64** environment.

### 📂 Included Files

* `Run_Build_Omnidrive_(EN).bat` – Windows batch starter (English) that automatically launches the MSYS2/UCRT64 environment and executes the build script.
* `build_omnidrive_EN.sh` – Shell script (English) that installs dependencies, automatically clones the required repositories, and compiles the firmware.
* `Run_Build_Omnidrive_(DE).bat` – Windows batch starter (German).
* `build_omnidrive_DE.sh` – Shell script (German).

### 📋 Prerequisites

* **Windows 10 / 11**
* **[MSYS2](https://msys2.org)** installed (default path `C:\msys64` is recommended).
* Stock firmware files (`HL-DT-ST_BD-RE_BU40N_1.00.bin` / `ASUS_BW-16D1HT_3.02.bin` – see the [OmniDrive repository](https://github.com/RibShark/OmniDrive#instructions)) for required filenames and checksums).

### 🚀 Usage

1. Download the build script files (`Run_Build_Omnidrive_(EN).bat` and `build_omnidrive_EN.sh`) into an empty folder of your choice.
2. In the respective `.sh` file, change the download URL at the beginning to point to the stock firmware: `FIRMWARE_ARCHIVE_URL="INSERT_YOUR_DOWNLOAD_URL_HERE"`
3. Double-click **`Run_Build_Omnidrive_(EN).bat`**.
4. Follow the on-screen instructions in the terminal window. All required source repositories are cloned and built automatically.

*(Alternatively, you can open the **MSYS2 UCRT64** terminal manually, navigate to the folder, and run `./build_omnidrive_EN.sh`.)*

### 🔗 Sources & Credits

This script automatically clones and builds the following upstream projects:

* **[RibShark/OmniDrive](https://github.com/RibShark/OmniDrive.git)** (`https://github.com/RibShark/OmniDrive.git`) – Custom firmware for MediaTek MT1959-based optical disc drives.
* **[Kingcom/armips](https://github.com/Kingcom/armips.git)** (`https://github.com/Kingcom/armips.git`) – Assembler for ARM and MIPS platforms required to build OmniDrive.

---

<a name="deutsch"></a>
## 🇩🇪 Deutsch

Ein kleines Hilfsskript (verfügbar auf Deutsch und Englisch), um die **[OmniDrive](https://github.com/RibShark/OmniDrive.git)**-Firmware unter Windows einfach über die **MSYS2 / UCRT64**-Umgebung zu kompilieren.

### 📂 Enthaltene Dateien

* `Run_Build_Omnidrive_(DE).bat` – Windows-Batch-Starter (Deutsch), der automatisch die MSYS2/UCRT64-Umgebung startet und das Build-Skript ausführt.
* `build_omnidrive_DE.sh` – Shell-Skript (Deutsch), das benötigte Pakete einrichtet, die erforderlichen Repositories automatisch klont und die Firmware kompiliert.
* `Run_Build_Omnidrive_(EN).bat` – Windows-Batch-Starter (Englisch).
* `build_omnidrive_EN.sh` – Shell-Skript (Englisch).

### 📋 Voraussetzungen

* **Windows 10 / 11**
* **[MSYS2](https://msys2.org)** installiert (der Standardpfad `C:\msys64` wird empfohlen).
* Originale Stock-Firmware-Dateien (`HL-DT-ST_BD-RE_BU40N_1.00.bin` / `ASUS_BW-16D1HT_3.02.bin` – genaue Dateinamen und Prüfsummen findest du im [OmniDrive repository](https://github.com/RibShark/OmniDrive#instructions)).

### 🚀 Verwendung

1. Lade die Skript-Dateien (`Run_Build_Omnidrive_(DE).bat` und `build_omnidrive_DE.sh`) in einen beliebigen leeren Ordner herunter.
2. Ändere in der jeweiligen `.sh` am anfang die Download URL zu der Stock Firmware `FIRMWARE_ARCHIVE_URL="DEINE_DOWNLOAD_URL_HIER_EINFUEGEN"`
3. Starte die Datei **`Run_Build_Omnidrive_(DE).bat`** per Doppelklick.
4. Folge den Anweisungen im Terminalfenster. Alle benötigten Quell-Repositories werden automatisch geklont und kompiliert.

*(Alternativ kannst du das **MSYS2 UCRT64**-Terminal manuell öffnen, in den Projektordner wechseln und `./build_omnidrive_DE.sh` ausführen.)*

### 🔗 Quellen & Verwendete Projekte

Dieses Skript klont und kompiliert automatisch die folgenden zugrunde liegenden Projekte:

* **[RibShark/OmniDrive](https://github.com/RibShark/OmniDrive.git)** (`https://github.com/RibShark/OmniDrive.git`) – Custom-Firmware für optische Laufwerke auf Basis des MediaTek MT1959.
* **[Kingcom/armips](https://github.com/Kingcom/armips.git)** (`https://github.com/Kingcom/armips.git`) – Assembler für ARM- und MIPS-Plattformen, der zum Kompilieren von OmniDrive benötigt wird.
