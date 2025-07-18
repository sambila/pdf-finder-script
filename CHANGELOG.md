# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.6] - 2025-07-18

### Fixed
- Fixed find command exit code handling that caused false failures
- Improved error handling for "no files found" scenarios
- Better distinction between real errors and empty results
- Enhanced exit code logic to handle find's behavior correctly

### Changed
- Replaced pipe-based file processing with temporary file approach
- Improved error messages for different failure scenarios
- Better handling of empty directory trees

## [1.1.5] - 2025-07-18

### Fixed
- Fixed subshell exit code issue that caused script to fail despite finding PDFs
- Removed problematic pipe construction that caused false failures
- Improved file processing workflow with separate find and process steps

### Changed
- Separated find operation from file processing to avoid subshell issues
- Enhanced error detection and reporting

## [1.1.4] - 2025-07-18

### Fixed
- Completely eliminated printf decimal number issues
- Removed all dependencies on `bc` command
- Fixed float formatting problems that caused script failures

### Changed
- Rewrote size formatting function using pure bash integer arithmetic
- Replaced all external tool dependencies with native bash operations
- Improved cross-platform compatibility by removing `bc` dependency

## [1.1.3] - 2025-07-18

### Fixed
- Fixed printf issues with decimal numbers in size formatting
- Improved integer-based calculation for file sizes
- Better handling of floating-point calculations without external tools

### Changed
- Enhanced size formatting with safer mathematical operations

## [1.1.2] - 2025-07-18

### Fixed
- Fixed readonly variable bug completely
- Improved variable scoping to prevent conflicts
- Better separation of constants and mutable variables

### Changed
- Reorganized variable declarations for clarity
- Enhanced cross-platform compatibility for date and stat commands

## [1.1.1] - 2025-07-18

### Fixed
- Fixed readonly variable bug that prevented script execution
- Improved cross-platform compatibility for date and stat commands
- Better error handling for systems without `bc` command
- Fixed quiet mode not being respected in all log functions

### Changed
- Variables are now properly scoped (readonly vs mutable)
- Enhanced fallback mechanisms for missing system tools
- Improved logging function behavior

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
- MIT License
- Comprehensive documentation (INSTALL.md, CONTRIBUTING.md)
- GitHub issue and PR templates
- .gitignore for better repository hygiene

### Changed
- Improved script structure with functions
- Enhanced error messages with context
- Better handling of files with spaces in names
- More robust file size calculation
- Improved cross-platform compatibility
- Enhanced report format with ISO timestamps
- Better memory usage with streaming operations
- Complete README overhaul with badges and better structure

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