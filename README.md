# PDF Finder Script

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux-blue)](https://github.com/sambila/pdf-finder-script)
[![Version](https://img.shields.io/badge/Version-1.1.0-green)](https://github.com/sambila/pdf-finder-script/releases)

A robust, cross-platform bash script that recursively finds all PDF files from the current directory and generates comprehensive reports with file names, sizes, and statistics.

## ✨ Features

- 🔍 **Recursive Search**: Finds all PDF files in current directory and subdirectories
- 📊 **Size Statistics**: Shows individual file sizes and total/average statistics
- 📝 **Detailed Reports**: Generates formatted text reports with all findings
- 🖥️ **Cross-Platform**: Works on both macOS and Linux/Debian systems
- 📋 **Sorted Output**: Results sorted by file size (largest first)
- 🔤 **Case-Insensitive**: Finds files with .pdf, .PDF, .Pdf extensions
- 🎛️ **Command-Line Options**: Flexible usage with various options
- 🔒 **Secure**: Input validation and secure file handling
- 🎨 **Colored Output**: Enhanced readability with color-coded messages
- ⚡ **Performance**: Optimized for speed with efficient file processing

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/sambila/pdf-finder-script.git
cd pdf-finder-script

# Make executable
chmod +x find_pdfs.sh

# Run the script
./find_pdfs.sh
```

For detailed installation instructions, see [INSTALL.md](INSTALL.md).

## 📖 Usage

### Basic Usage

```bash
# Search for PDFs in current directory
./find_pdfs.sh

# Generate report with custom filename
./find_pdfs.sh -o my_report.txt

# Run in quiet mode
./find_pdfs.sh --quiet
```

### Command-Line Options

| Option | Description |
|--------|-------------|
| `-o, --output FILE` | Specify output file name (default: pdf_report.txt) |
| `-h, --help` | Show help message and usage information |
| `-v, --version` | Display version information |
| `-q, --quiet` | Suppress non-error output |
| `-d, --debug` | Enable debug mode for troubleshooting |

### Examples

```bash
# Basic usage
./find_pdfs.sh

# Custom output file
./find_pdfs.sh --output documents_report.txt

# Quiet mode for scripts
./find_pdfs.sh -q -o /tmp/pdf_list.txt

# Debug mode for troubleshooting
./find_pdfs.sh --debug

# Show help
./find_pdfs.sh --help
```

## 📋 Output Format

The generated report contains:

- **Header**: Generation timestamp, directory, and system info
- **File List**: Each PDF with path and formatted size
- **Summary**: Statistics including total files, size, and averages
- **Performance**: Processing time and completion timestamp

### Example Output

```
PDF FILES REPORT
================
Generated: 2025-07-17T15:20:03+02:00
Start directory: /home/user/documents
System: Linux 5.4.0-74-generic
Script version: 1.1.0

File: presentations/annual_report.pdf
Size: 15.2MB
---
File: manuals/user_guide.pdf
Size: 8.7MB
---
File: invoices/invoice_2025.pdf
Size: 245.3KB
---

SUMMARY
=======
Total PDF files: 3
Total size: 24.1MB
Average size: 8.0MB
Search completed: 2025-07-17T15:20:05+02:00
Processing time: 2 seconds
```

## 🔧 System Requirements

- **Operating System**: macOS, Linux, or Debian-based systems
- **Shell**: Bash 4.0 or higher
- **Tools**: Standard Unix tools (`find`, `sort`, `awk`, `stat`)
- **Permissions**: Read access to target directories

## 🛡️ Security Features

- Input validation for all parameters
- Secure temporary file handling
- File permission checking
- Protection against path traversal
- Comprehensive error handling
- Safe cleanup on exit

## 🔄 Updates

To update to the latest version:

```bash
cd pdf-finder-script
git pull origin main
chmod +x find_pdfs.sh
```

## 📚 Documentation

- [Installation Guide](INSTALL.md) - Detailed setup instructions
- [Changelog](CHANGELOG.md) - Version history and changes
- [License](LICENSE) - MIT License details

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Development

```bash
# Clone for development
git clone https://github.com/sambila/pdf-finder-script.git
cd pdf-finder-script

# Make changes and test
./find_pdfs.sh --debug

# Check script with shellcheck (optional)
shellcheck find_pdfs.sh
```

## 🐛 Issues & Support

- **Bug Reports**: [GitHub Issues](https://github.com/sambila/pdf-finder-script/issues)
- **Feature Requests**: [GitHub Issues](https://github.com/sambila/pdf-finder-script/issues)
- **Questions**: [GitHub Discussions](https://github.com/sambila/pdf-finder-script/discussions)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Created with ❤️ for efficient PDF file management and cataloging across different systems.

---

**⭐ Star this repo if you find it useful!**