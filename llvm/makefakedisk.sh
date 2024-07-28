#!/bin/bash

# Name der Ausgabedatei
output_file="fakedisk.d81"

# Anzahl der 256-Byte-Blöcke
num_blocks=3200

echo Generates $output_file and overwrites if it exists.
read -p "Press [Enter] key to continue."

# Ausgabedatei initialisieren/leeren
> "$output_file"

for ((i=0; i<num_blocks; i++)); do
    # 256 Byte Block erstellen, initialisiert mit 0x00
    block=$(printf "%256s" | tr ' ' '\0')

    # Blocknummer (4 Byte) am Anfang des Blocks einfügen
    block_number=$(printf "%04x" $i | xxd -r -p)

    # Ersetze die ersten 4 Byte des Blocks mit der Blocknummer
    block=$(echo -n -e "${block_number}${block:4}")

    # Block in die Ausgabedatei schreiben
    echo -n -e "$block" >> "$output_file"
done

echo "Binärdatei $output_file erfolgreich erstellt."
read -p "Press [Enter] key to exit."
