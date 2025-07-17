# Installation Guide

This guide will walk you through installing and using the PDF Finder Script on your system.

## Prerequisites

Before installing, make sure you have:
- Git installed on your system
- A Unix-like operating system (macOS, Linux, Debian, Ubuntu, etc.)
- Bash shell (usually pre-installed)
- Terminal/command line access

## Installation Methods

### Method 1: Clone the Repository (Recommended)

1. **Open your terminal**

2. **Navigate to where you want to install the script**
   ```bash
   cd ~/Downloads
   # or any directory where you want to store the script
   ```

3. **Clone the repository**
   ```bash
   git clone https://github.com/sambila/pdf-finder-script.git
   ```

4. **Navigate to the script directory**
   ```bash
   cd pdf-finder-script
   ```

5. **Make the script executable**
   ```bash
   chmod +x find_pdfs.sh
   ```

6. **Test the installation**
   ```bash
   ./find_pdfs.sh
   ```

### Method 2: Download Single File

If you only want the script file without the full repository:

1. **Download the script directly**
   ```bash
   curl -O https://raw.githubusercontent.com/sambila/pdf-finder-script/main/find_pdfs.sh
   ```

2. **Make it executable**
   ```bash
   chmod +x find_pdfs.sh
   ```

### Method 3: Global Installation (Optional)

To use the script from anywhere on your system:

1. **After cloning, copy to a directory in your PATH**
   ```bash
   sudo cp find_pdfs.sh /usr/local/bin/pdf-finder
   ```

2. **Now you can run it from anywhere**
   ```bash
   pdf-finder
   ```

## Quick Start Usage

1. **Navigate to the directory you want to search**
   ```bash
   cd /path/to/your/documents
   ```

2. **Run the script**
   ```bash
   /path/to/pdf-finder-script/find_pdfs.sh
   ```
   
   Or if you installed it globally:
   ```bash
   pdf-finder
   ```

3. **Check the results**
   The script will create a `pdf_report.txt` file in your current directory with all findings.

## Example Workflow

Here's a complete example of how to install and use the script:

```bash
# 1. Go to your home directory
cd ~

# 2. Clone the repository
git clone https://github.com/sambila/pdf-finder-script.git

# 3. Navigate to the script directory
cd pdf-finder-script

# 4. Make it executable
chmod +x find_pdfs.sh

# 5. Go to the directory you want to search (e.g., Documents)
cd ~/Documents

# 6. Run the script
~/pdf-finder-script/find_pdfs.sh

# 7. View the results
cat pdf_report.txt
```

## Updating the Script

To get the latest version:

1. **Navigate to the script directory**
   ```bash
   cd pdf-finder-script
   ```

2. **Pull the latest changes**
   ```bash
   git pull origin main
   ```

3. **Make sure it's still executable**
   ```bash
   chmod +x find_pdfs.sh
   ```

## Troubleshooting

### Common Issues:

**Permission Denied Error:**
```bash
# Solution: Make the script executable
chmod +x find_pdfs.sh
```

**Command Not Found:**
```bash
# Solution: Use the full path to the script
./find_pdfs.sh
# or
/full/path/to/find_pdfs.sh
```

**Git Not Installed:**
```bash
# On Ubuntu/Debian:
sudo apt update && sudo apt install git

# On macOS with Homebrew:
brew install git

# On CentOS/RHEL:
sudo yum install git
```

### Getting Help

If you encounter any issues:
1. Check that you have the required permissions
2. Verify that bash is available: `which bash`
3. Test with a simple directory first
4. Check the GitHub issues page for known problems

## Uninstalling

To remove the script:

1. **Remove the cloned directory**
   ```bash
   rm -rf pdf-finder-script
   ```

2. **If you installed it globally, remove it from PATH**
   ```bash
   sudo rm /usr/local/bin/pdf-finder
   ```

## Next Steps

After installation, you can:
- Run the script in different directories to catalog your PDFs
- Use the generated reports to analyze your document collections
- Integrate the script into your backup or organization workflows
- Customize the script for your specific needs

For more detailed information about features and usage, see the main [README.md](README.md).