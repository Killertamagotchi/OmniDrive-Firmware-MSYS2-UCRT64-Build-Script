#!/usr/bin/env bash
export LANG="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"
set -e
trap 'echo ""; read -n 1 -s -r -p "Skript beendet. Taste drücken zum Schließen..."' EXIT
# ==============================================================================
# KONFIGURATION
# ==============================================================================
# Ersetze den Platzhalter unten durch deine direkte Download-URL zum "stock_firmware.tar.gz" Archiv:
FIRMWARE_ARCHIVE_URL="https://p64rs.free-for-all.net/omnidrive/stock_firmware.tar.gz"
# ==============================================================================

# Verzeichnis ermitteln, in dem dieses Skript liegt
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== 1. Prüfe MSYS2-Umgebung ==="
if [[ "$MSYSTEM" != "UCRT64" ]]; then
    echo "FEHLER: Bitte führe dieses Skript im 'MSYS2 UCRT64'-Terminal aus!"
    echo "Aktuelle Umgebung: ${MSYSTEM:-Unbekannt}"
    exit 1
fi

echo "=== 2. Prüfe, installiere und aktualisiere Pakete ==="
PACKAGES=(
    "git"
    "curl"
    "tar"
    "mingw-w64-ucrt-x86_64-gcc"
    "mingw-w64-ucrt-x86_64-cmake"
    "mingw-w64-ucrt-x86_64-ninja"
    "mingw-w64-ucrt-x86_64-arm-none-eabi-toolchain"
    "mingw-w64-ucrt-x86_64-python"
    "mingw-w64-ucrt-x86_64-python-pycryptodome"
)

pacman -Syu --needed --noconfirm "${PACKAGES[@]}"

# Hilfsfunktion zum Klonen oder Aktualisieren von Git-Repositories
sync_git_repo() {
    local repo_url="$1"
    local target_dir="$2"
    local repo_name="$3"

    if [ ! -d "$target_dir/.git" ]; then
        echo "-> Klone $repo_name nach $target_dir..."
        git clone --recursive "$repo_url" "$target_dir"
        return 0
    else
        echo "-> Prüfe $repo_name auf Updates..."
        cd "$target_dir"
        git fetch origin
        local local_hash=$(git rev-parse HEAD)
        local remote_hash=$(git rev-parse @{u})

        if [ "$local_hash" != "$remote_hash" ]; then
            echo "-> Updates für $repo_name gefunden. Aktualisiere..."
            git pull --ff-only
            git submodule update --init --recursive
            cd "$SCRIPT_DIR"
            return 0
        else
            echo "-> $repo_name ist bereits aktuell."
            cd "$SCRIPT_DIR"
            return 1
        fi
    fi
}

echo "=== 3. Prüfe und baue armips ==="
ARMIPS_DIR="$SCRIPT_DIR/armips"
ARMIPS_UPDATED=0
if sync_git_repo "https://github.com/Kingcom/armips.git" "$ARMIPS_DIR" "armips"; then
    ARMIPS_UPDATED=1
fi

if [ "$ARMIPS_UPDATED" -eq 1 ] || [ ! -f "$ARMIPS_DIR/build/armips.exe" ]; then
    echo "-> Kompiliere armips..."
    mkdir -p "$ARMIPS_DIR/build"
    cd "$ARMIPS_DIR/build"
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
    ninja
    cd "$SCRIPT_DIR"
else
    echo "-> armips.exe ist bereits aktuell gebaut."
fi

echo "=== 4. Prüfe und aktualisiere OmniDrive ==="
OMNIDRIVE_DIR="$SCRIPT_DIR/OmniDrive"
sync_git_repo "https://github.com/RibShark/OmniDrive.git" "$OMNIDRIVE_DIR" "OmniDrive" || true

echo "=== 5. Kopiere armips.exe nach OmniDrive/asm ==="
mkdir -p "$OMNIDRIVE_DIR/asm"
cp -f "$ARMIPS_DIR/build/armips.exe" "$OMNIDRIVE_DIR/asm/armips.exe"
echo "-> armips.exe erfolgreich nach $OMNIDRIVE_DIR/asm/ kopiert."

echo "=== 6. Prüfe und lade Stock-Firmware ==="
FW_DIR="$OMNIDRIVE_DIR/firmware"
FW1="$FW_DIR/HL-DT-ST_BD-RE_BU40N_1.00.bin"
FW2="$FW_DIR/ASUS_BW-16D1HT_3.02.bin"
mkdir -p "$FW_DIR"

if [ ! -f "$FW1" ] || [ ! -f "$FW2" ]; then
    echo "-> Benötigte Firmware-Dateien fehlen in $FW_DIR."

    if [[ -z "$FIRMWARE_ARCHIVE_URL" || "$FIRMWARE_ARCHIVE_URL" == "DEINE_DOWNLOAD_URL_HIER_EINFUEGEN" ]]; then
        echo "FEHLER: Bitte trage oben im Skript bei 'FIRMWARE_ARCHIVE_URL' deine Download-URL ein!"
        exit 1
    fi

    ARCHIVE_PATH="$FW_DIR/stock_firmware.tar.gz"
    echo "-> Lade Firmware-Archiv herunter..."
    curl -fL "$FIRMWARE_ARCHIVE_URL" -o "$ARCHIVE_PATH"

    echo "-> Entpacke Archiv nach $FW_DIR..."
    tar -xzf "$ARCHIVE_PATH" -C "$FW_DIR"

    echo "-> Lösche heruntergeladenes Archiv..."
    rm -f "$ARCHIVE_PATH"

    # Erneute Prüfung, ob die erwarteten Dateien nach dem Entpacken direkt im Ordner liegen
    if [ ! -f "$FW1" ] || [ ! -f "$FW2" ]; then
        echo "FEHLER: Archiv wurde entpackt, aber die erwarteten .bin-Dateien wurden nicht direkt in $FW_DIR gefunden!"
        echo "Prüfe, ob im Archiv eventuell ein Unterordner enthalten ist."
        exit 1
    fi
else
    echo "-> Beide Stock-Firmware-Dateien sind bereits vorhanden."
fi

echo "=== 7. Kompiliere OmniDrive Firmware ==="
mkdir -p "$OMNIDRIVE_DIR/build"
cd "$OMNIDRIVE_DIR/build"
cmake -G Ninja ..
ninja

echo ""
echo "=== FERTIG! ==="
echo "Die gepatchten Firmware-Dateien liegen nun in: $OMNIDRIVE_DIR/patched_firmware"