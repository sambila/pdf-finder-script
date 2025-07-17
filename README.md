# PDF Finder Script

A cross-platform bash script that recursively finds all PDF files from the current directory and generates a comprehensive report with file names, sizes, and statistics.

## Features

- 🔍 **Recursive Search**: Finds all PDF files in current directory and subdirectories
- 📊 **Size Statistics**: Shows individual file sizes and total/average statistics
- 📝 **Detailed Report**: Generates a formatted text report with all findings
- 🖥️ **Cross-Platform**: Works on both macOS and Linux/Debian systems
- 📋 **Sorted Output**: Results sorted by file size (largest first)
- 🔤 **Case-Insensitive**: Finds files with .pdf, .PDF, .Pdf extensions

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/sambila/pdf-finder-script.git
   cd pdf-finder-script
   ```

2. Make the script executable:
   ```bash
   chmod +x find_pdfs.sh
   ```

## Usage

1. Navigate to the directory where you want to start the search
2. Run the script:
   ```bash
   ./find_pdfs.sh
   ```

3. The script will:
   - Search recursively for all PDF files
   - Generate a report file called `pdf_report.txt` in the current directory
   - Display a preview of the results in the terminal

## Output Format

The generated `pdf_report.txt` contains:

- **Header**: Generation date, start directory, and system information
- **File List**: Each PDF file with its path and formatted size
- **Summary**: Total number of files, total size, and average file size

### Example Output

```
PDF DATEIEN REPORT
==================
Generiert am: Thu Jul 17 15:20:03 CEST 2025
Startverzeichnis: /home/user/documents
System: Linux

Datei: large_document.pdf
Größe: 15MB
---
Datei: presentation.pdf
Größe: 8.5MB
---
Datei: manual.pdf
Größe: 2.3MB
---

ZUSAMMENFASSUNG
===============
Anzahl PDF-Dateien: 3
Gesamtgröße: 25.8MB
Durchschnittsgröße: 8.6MB
```

## System Requirements

- **Unix-like system**: macOS, Linux, or Debian
- **Bash shell**: Version 3.0 or higher
- **Standard tools**: `find`, `ls`, `sort`, `awk` (usually pre-installed)

## Technical Details

- Uses `find` command with case-insensitive search (`-iname "*.pdf"`)
- Automatically formats file sizes (B, KB, MB, GB)
- Handles permission errors gracefully
- Compatible with both GNU coreutils (Linux) and BSD tools (macOS)
- Temporary files are automatically cleaned up

## Contributing

Feel free to submit issues, feature requests, or pull requests. Contributions are welcome!

## License

This project is open source and available under the [MIT License](LICENSE).

## Author

Created for efficient PDF file management and cataloging across different systems.