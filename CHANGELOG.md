# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-07-17

### Added
- Command-line options support (`-h`, `-v`, `-o`, `-q`, `-d`)
- Comprehensive help system with `--help` option
- Version information with `--version` option
- Quiet mode for minimal output (`--quiet`)
- Debug mode for troubleshooting (`--debug`)
- Custom output file specification (`--output`)
- Colored output for better readability
- Proper error handling with exit codes
- Input validation for all parameters
- Secure file handling with proper permissions checking
- Performance timing in reports
- Better size formatting with decimal precision
- Comprehensive logging system (info, warn, error, success)
- Temporary directory cleanup on exit
- Race condition protection for file operations

### Changed
- Improved script structure with functions
- Enhanced error messages with context
- Better handling of files with spaces in names
- More robust file size calculation
- Improved cross-platform compatibility
- Enhanced report format with ISO timestamps
- Better memory usage with streaming operations

### Fixed
- Fixed potential security issues with file paths
- Improved handling of permission errors
- Fixed edge cases with empty directories
- Better handling of symbolic links
- Improved error recovery mechanisms

### Security
- Added input validation for all user inputs
- Implemented secure temporary file handling
- Added proper file permission checks
- Protected against path traversal attacks
- Added comprehensive error handling

## [1.0.0] - 2025-07-17

### Added
- Initial release of PDF Finder Script
- Basic recursive PDF file search functionality
- File size calculation and formatting
- Simple text report generation
- Cross-platform support (macOS, Linux, Debian)
- Case-insensitive file matching
- Basic statistics (total files, total size, average size)
- Simple command-line interface

### Features
- Recursive directory scanning
- PDF file detection (.pdf, .PDF, .Pdf)
- File size statistics
- Formatted output report
- Cross-platform compatibility