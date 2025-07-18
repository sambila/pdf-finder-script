#!/bin/bash

# PDF Finder Script
# Finds all PDF files from current directory recursively
# Works on macOS and Linux/Debian systems
# 
# Author: PDF Finder Script
# Version: 1.1.2
# License: MIT

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Constants - only these are readonly
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_VERSION="1.1.2"
readonly DEFAULT_OUTPUT_FILE="pdf_report.txt"

# Temporary directory
TEMP_DIR=$(mktemp -d)
readonly TEMP_DIR

# Global variables - NOT readonly so they can be modified
OUTPUT_FILE="$DEFAULT_OUTPUT_FILE"
QUIET=false
DEBUG=false

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Cleanup function
cleanup() {
    local exit_code=$?
    [[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"
    exit $exit_code
}

# Set trap for cleanup
trap cleanup EXIT INT TERM

# Logging functions
log_info() {
    [[ "$QUIET" == "true" ]] && return
    echo -e "${BLUE}[INFO]${NC} $1" >&2
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1" >&2
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

log_success() {
    [[ "$QUIET" == "true" ]] && return
    echo -e "${GREEN}[SUCCESS]${NC} $1" >&2
}

# Help function
show_help() {
    cat << EOF
$SCRIPT_NAME v$SCRIPT_VERSION

USAGE:
    $SCRIPT_NAME [OPTIONS]

DESCRIPTION:
    Recursively finds all PDF files from the current directory and generates
    a comprehensive report with file names, sizes, and statistics.

OPTIONS:
    -o, --output FILE    Output file name (default: pdf_report.txt)
    -h, --help          Show this help message
    -v, --version       Show version information
    -q, --quiet         Suppress non-error output
    -d, --debug         Enable debug mode

EXAMPLES:
    $SCRIPT_NAME                    # Basic usage
    $SCRIPT_NAME -o my_report.txt   # Custom output file
    $SCRIPT_NAME -q                 # Quiet mode

EOF
}

# Version function
show_version() {
    echo "$SCRIPT_NAME version $SCRIPT_VERSION"
}

# Size formatting function with improved error handling
format_size() {
    local size=$1
    
    # Validate input
    if [[ ! "$size" =~ ^[0-9]+$ ]]; then
        echo "0B"
        return 1
    fi
    
    if command -v numfmt >/dev/null 2>&1; then
        # Linux/GNU coreutils
        numfmt --to=iec-i --suffix=B "$size" 2>/dev/null || echo "${size}B"
    else
        # macOS fallback with better precision
        if (( size < 1024 )); then
            echo "${size}B"
        elif (( size < 1048576 )); then
            printf "%.1fKB" "$(echo "scale=1; $size/1024" | bc 2>/dev/null || echo "$((size/1024))")"
        elif (( size < 1073741824 )); then
            printf "%.1fMB" "$(echo "scale=1; $size/1048576" | bc 2>/dev/null || echo "$((size/1048576))")"
        else
            printf "%.1fGB" "$(echo "scale=1; $size/1073741824" | bc 2>/dev/null || echo "$((size/1073741824))")"
        fi
    fi
}

# Validate output file
validate_output_file() {
    local output_file="$1"
    local output_dir
    
    output_dir=$(dirname "$output_file")
    
    # Check if directory exists and is writable
    if [[ ! -d "$output_dir" ]]; then
        log_error "Output directory '$output_dir' does not exist"
        return 1
    fi
    
    if [[ ! -w "$output_dir" ]]; then
        log_error "Output directory '$output_dir' is not writable"
        return 1
    fi
    
    # Check if file exists and is writable
    if [[ -f "$output_file" ]] && [[ ! -w "$output_file" ]]; then
        log_error "Output file '$output_file' exists but is not writable"
        return 1
    fi
    
    return 0
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -o|--output)
                if [[ -n "${2:-}" ]]; then
                    OUTPUT_FILE="$2"
                    shift 2
                else
                    log_error "Option $1 requires an argument"
                    return 1
                fi
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            -v|--version)
                show_version
                exit 0
                ;;
            -q|--quiet)
                QUIET=true
                shift
                ;;
            -d|--debug)
                DEBUG=true
                set -x
                shift
                ;;
            -*)
                log_error "Unknown option: $1"
                show_help
                return 1
                ;;
            *)
                log_error "Unexpected argument: $1"
                show_help
                return 1
                ;;
        esac
    done
    
    return 0
}

# Main function
main() {
    local temp_file="$TEMP_DIR/pdf_list.tmp"
    local total_files=0
    local total_size=0
    local start_time
    
    start_time=$(date +%s)
    
    # Validate output file
    if ! validate_output_file "$OUTPUT_FILE"; then
        return 1
    fi
    
    log_info "Starting PDF search from: $(pwd)"
    log_info "Output file: $OUTPUT_FILE"
    
    # Create report header
    cat > "$OUTPUT_FILE" << EOF
PDF FILES REPORT
================
Generated: $(date -Iseconds 2>/dev/null || date)
Start directory: $(pwd)
System: $(uname -s) $(uname -r 2>/dev/null || echo "")
Script version: $SCRIPT_VERSION

EOF
    
    log_info "Searching for PDF files..."
    
    # Find PDF files with improved error handling
    if find . -type f \( -iname "*.pdf" \) -print0 2>/dev/null | \
        while IFS= read -r -d '' file; do
            # Skip if file doesn't exist (race condition protection)
            [[ ! -f "$file" ]] && continue
            
            # Get file size safely
            if [[ -r "$file" ]]; then
                local size
                # Try different stat commands for cross-platform compatibility
                if command -v stat >/dev/null 2>&1; then
                    # Linux
                    size=$(stat -c%s "$file" 2>/dev/null) || \
                    # macOS
                    size=$(stat -f%z "$file" 2>/dev/null) || \
                    size="0"
                else
                    size="0"
                fi
                
                # Clean path (remove leading ./)
                local clean_path="${file#./}"
                
                # Format size
                local formatted_size
                formatted_size=$(format_size "$size")
                
                # Write to temp file with proper escaping
                printf '%s|%s|%s\n' "$clean_path" "$size" "$formatted_size" >> "$temp_file"
            else
                log_warn "Cannot read file: $file"
            fi
        done; then
        
        if [[ ! -s "$temp_file" ]]; then
            log_warn "No PDF files found in current directory tree"
            echo "No PDF files found." >> "$OUTPUT_FILE"
            return 0
        fi
        
        # Sort by size (descending) and generate report
        sort -t'|' -k2,2nr "$temp_file" | while IFS='|' read -r filepath size formatted_size; do
            printf "File: %s\nSize: %s\n---\n" "$filepath" "$formatted_size" >> "$OUTPUT_FILE"
        done
        
        # Calculate statistics
        total_files=$(wc -l < "$temp_file")
        total_size=$(awk -F'|' '{sum += $2} END {print sum+0}' "$temp_file")
        
        # Add summary
        {
            echo ""
            echo "SUMMARY"
            echo "======="
            echo "Total PDF files: $total_files"
            echo "Total size: $(format_size "$total_size")"
            
            if (( total_files > 0 )); then
                echo "Average size: $(format_size "$((total_size / total_files))")"
            fi
            
            echo "Search completed: $(date -Iseconds 2>/dev/null || date)"
            echo "Processing time: $(($(date +%s) - start_time)) seconds"
        } >> "$OUTPUT_FILE"
        
        log_success "Report generated successfully!"
        log_info "Found $total_files PDF files ($(format_size "$total_size"))"
        
        # Show preview unless in quiet mode
        if [[ "$QUIET" == "false" ]]; then
            echo ""
            echo "Preview of report:"
            echo "=================="
            head -n 20 "$OUTPUT_FILE"
            
            if (( $(wc -l < "$OUTPUT_FILE") > 20 )); then
                echo "..."
                echo "(truncated - see $OUTPUT_FILE for full report)"
            fi
        fi
        
    else
        log_error "Failed to search for PDF files"
        return 1
    fi
    
    return 0
}

# Script entry point
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Parse arguments
    if ! parse_args "$@"; then
        exit 1
    fi
    
    # Run main function
    if ! main; then
        log_error "Script failed to complete successfully"
        exit 1
    fi
fi