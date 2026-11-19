#!/usr/bin/env bash
set -e
trap 'echo ""; read -n 1 -s -r -p "Script finished. Press any key to close..."' EXIT
# ==============================================================================
# CONFIGURATION
# ==============================================================================
# Replace the placeholder below with your direct download URL to the "stock_firmware.tar.gz" archive:
FIRMWARE_ARCHIVE_URL="INSERT_YOUR_DOWNLOAD_URL_HERE"
# ==============================================================================

# Determine the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== 1. Checking MSYS2 environment ==="
if [[ "$MSYSTEM" != "UCRT64" ]]; then
    echo "ERROR: Please run this script inside the 'MSYS2 UCRT64' terminal!"
    echo "Current environment: ${MSYSTEM:-Unknown}"
    exit 1
fi

echo "=== 2. Checking, installing, and updating packages ==="
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

# Helper function to clone or update Git repositories
sync_git_repo() {
    local repo_url="$1"
    local target_dir="$2"
    local repo_name="$3"

    if [ ! -d "$target_dir/.git" ]; then
        echo "-> Cloning $repo_name into $target_dir..."
        git clone --recursive "$repo_url" "$target_dir"
        return 0
    else
        echo "-> Checking $repo_name for updates..."
        cd "$target_dir"
        git fetch origin
        local local_hash=$(git rev-parse HEAD)
        local remote_hash=$(git rev-parse @{u})

        if [ "$local_hash" != "$remote_hash" ]; then
            echo "-> Updates found for $repo_name. Updating..."
            git pull --ff-only
            git submodule update --init --recursive
            cd "$SCRIPT_DIR"
            return 0
        else
            echo "-> $repo_name is already up to date."
            cd "$SCRIPT_DIR"
            return 1
        fi
    fi
}

echo "=== 3. Checking and building armips ==="
ARMIPS_DIR="$SCRIPT_DIR/armips"
ARMIPS_UPDATED=0
if sync_git_repo "https://github.com/Kingcom/armips.git" "$ARMIPS_DIR" "armips"; then
    ARMIPS_UPDATED=1
fi

if [ "$ARMIPS_UPDATED" -eq 1 ] || [ ! -f "$ARMIPS_DIR/build/armips.exe" ]; then
    echo "-> Compiling armips..."
    mkdir -p "$ARMIPS_DIR/build"
    cd "$ARMIPS_DIR/build"
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
    ninja
    cd "$SCRIPT_DIR"
else
    echo "-> armips.exe is already built and up to date."
fi

echo "=== 4. Checking and updating OmniDrive ==="
OMNIDRIVE_DIR="$SCRIPT_DIR/OmniDrive"
sync_git_repo "https://github.com/RibShark/OmniDrive.git" "$OMNIDRIVE_DIR" "OmniDrive" || true

echo "=== 5. Copying armips.exe to OmniDrive/asm ==="
mkdir -p "$OMNIDRIVE_DIR/asm"
cp -f "$ARMIPS_DIR/build/armips.exe" "$OMNIDRIVE_DIR/asm/armips.exe"
echo "-> Successfully copied armips.exe to $OMNIDRIVE_DIR/asm/."

echo "=== 6. Checking and downloading stock firmware ==="
FW_DIR="$OMNIDRIVE_DIR/firmware"
FW1="$FW_DIR/HL-DT-ST_BD-RE_BU40N_1.00.bin"
FW2="$FW_DIR/ASUS_BW-16D1HT_3.02.bin"
mkdir -p "$FW_DIR"

if [ ! -f "$FW1" ] || [ ! -f "$FW2" ]; then
    echo "-> Required firmware files are missing in $FW_DIR."

    if [[ -z "$FIRMWARE_ARCHIVE_URL" || "$FIRMWARE_ARCHIVE_URL" == "INSERT_YOUR_DOWNLOAD_URL_HERE" ]]; then
        echo "ERROR: Please enter your download URL at 'FIRMWARE_ARCHIVE_URL' at the top of the script!"
        exit 1
    fi

    ARCHIVE_PATH="$FW_DIR/stock_firmware.tar.gz"
    echo "-> Downloading firmware archive..."
    curl -fL "$FIRMWARE_ARCHIVE_URL" -o "$ARCHIVE_PATH"

    echo "-> Extracting archive to $FW_DIR..."
    tar -xzf "$ARCHIVE_PATH" -C "$FW_DIR"

    echo "-> Deleting downloaded archive..."
    rm -f "$ARCHIVE_PATH"

    # Re-verify that the expected files are directly inside the folder after extraction
    if [ ! -f "$FW1" ] || [ ! -f "$FW2" ]; then
        echo "ERROR: Archive was extracted, but the expected .bin files were not found directly in $FW_DIR!"
        echo "Please check if the archive contains a subfolder."
        exit 1
    fi
else
    echo "-> Both stock firmware files are already present."
fi

echo "=== 7. Compiling OmniDrive firmware ==="
mkdir -p "$OMNIDRIVE_DIR/build"
cd "$OMNIDRIVE_DIR/build"
cmake -G Ninja ..
ninja

echo ""
echo "=== DONE! ==="
echo "The patched firmware files are now located in: $OMNIDRIVE_DIR/patched_firmware"