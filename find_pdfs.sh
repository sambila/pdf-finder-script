#!/bin/bash

# PDF Finder Script
# Findet alle PDF-Dateien ab dem aktuellen Verzeichnis
# Funktioniert auf Mac und Debian/Linux

# Ausgabedatei im aktuellen Verzeichnis
OUTPUT_FILE="pdf_report.txt"

# Funktion zur Formatierung der Dateigröße
format_size() {
    local size=$1
    if command -v numfmt >/dev/null 2>&1; then
        # Linux/GNU coreutils
        numfmt --to=iec-i --suffix=B $size
    else
        # macOS fallback
        if [ $size -lt 1024 ]; then
            echo "${size}B"
        elif [ $size -lt 1048576 ]; then
            echo "$(($size / 1024))KB"
        elif [ $size -lt 1073741824 ]; then
            echo "$(($size / 1048576))MB"
        else
            echo "$(($size / 1073741824))GB"
        fi
    fi
}

# Prüfe ob wir im richtigen Verzeichnis sind
echo "Starte PDF-Suche ab: $(pwd)"
echo "Ausgabedatei: $OUTPUT_FILE"

# Erstelle/Leere die Ausgabedatei
cat > "$OUTPUT_FILE" << EOF
PDF DATEIEN REPORT
==================
Generiert am: $(date)
Startverzeichnis: $(pwd)
System: $(uname -s)

EOF

# Variablen für Statistiken
total_files=0
total_size=0

# Temporäre Datei für die Ergebnisse
temp_file=$(mktemp)

# Finde alle PDF-Dateien (case-insensitive)
echo "Durchsuche Verzeichnisse..."

# Verwende find mit case-insensitive Suche
find . -type f \( -iname "*.pdf" \) -exec ls -la {} \; 2>/dev/null | while read -r permissions links owner group size month day time_or_year filepath; do
    # Überspringe Zeilen die nicht das erwartete Format haben
    if [[ ! "$size" =~ ^[0-9]+$ ]]; then
        continue
    fi
    
    # Entferne führendes "./" vom Pfad
    clean_path=$(echo "$filepath" | sed 's|^\./||')
    
    # Formatiere die Größe
    formatted_size=$(format_size "$size")
    
    # Schreibe in temporäre Datei
    echo "$clean_path|$size|$formatted_size" >> "$temp_file"
done

# Sortiere die Ergebnisse nach Dateigröße (absteigend)
sort -t'|' -k2,2nr "$temp_file" | while IFS='|' read -r filepath size formatted_size; do
    echo "Datei: $filepath" >> "$OUTPUT_FILE"
    echo "Größe: $formatted_size" >> "$OUTPUT_FILE"
    echo "---" >> "$OUTPUT_FILE"
    
    total_files=$((total_files + 1))
    total_size=$((total_size + size))
done

# Berechne Statistiken neu (da while-Schleife in Subshell läuft)
total_files=$(wc -l < "$temp_file")
total_size=$(awk -F'|' '{sum += $2} END {print sum}' "$temp_file")

# Füge Zusammenfassung hinzu
echo "" >> "$OUTPUT_FILE"
echo "ZUSAMMENFASSUNG" >> "$OUTPUT_FILE"
echo "===============" >> "$OUTPUT_FILE"
echo "Anzahl PDF-Dateien: $total_files" >> "$OUTPUT_FILE"
echo "Gesamtgröße: $(format_size $total_size)" >> "$OUTPUT_FILE"
echo "Durchschnittsgröße: $(format_size $((total_size / (total_files > 0 ? total_files : 1))))" >> "$OUTPUT_FILE"

# Aufräumen
rm -f "$temp_file"

echo "Fertig! Ergebnisse wurden in '$OUTPUT_FILE' gespeichert."
echo "Gefundene PDFs: $total_files"
echo "Gesamtgröße: $(format_size $total_size)"

# Zeige ersten paar Zeilen der Ausgabedatei
echo ""
echo "Vorschau der ersten Einträge:"
echo "=============================="
head -n 20 "$OUTPUT_FILE"