# Contributing to PDF Finder Script

Thank you for your interest in contributing to the PDF Finder Script! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Reporting Bugs

Before submitting a bug report, please:

1. **Check existing issues** to avoid duplicates
2. **Use the latest version** of the script
3. **Test on a clean environment** if possible

When reporting bugs, please use our [Bug Report Template](.github/ISSUE_TEMPLATE/bug_report.md) and include:

- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Environment details (OS, Bash version, etc.)
- Error messages/output
- Directory structure (if relevant)

### Requesting Features

For feature requests, please use our [Feature Request Template](.github/ISSUE_TEMPLATE/feature_request.md) and include:

- Clear description of the feature
- Use case and motivation
- Example usage
- Implementation ideas (if any)

### Contributing Code

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes**
4. **Test thoroughly**
5. **Commit your changes** (`git commit -m 'Add amazing feature'`)
6. **Push to the branch** (`git push origin feature/amazing-feature`)
7. **Open a Pull Request**

## 📋 Development Guidelines

### Code Style

- **Follow existing style** in the script
- **Use consistent indentation** (4 spaces)
- **Add comments** for complex logic
- **Use descriptive variable names**
- **Follow bash best practices**

### Testing

Before submitting a PR, please test your changes:

```bash
# Test basic functionality
./find_pdfs.sh

# Test with different options
./find_pdfs.sh -o test_report.txt
./find_pdfs.sh -q
./find_pdfs.sh --help

# Test error conditions
./find_pdfs.sh -o /nonexistent/path/report.txt

# Test on different systems if possible
```

### Bash Best Practices

- Use `set -euo pipefail` for error handling
- Quote variables: `"$variable"` instead of `$variable`
- Use `[[ ]]` instead of `[ ]` for conditions
- Check command availability with `command -v`
- Handle edge cases (empty files, permission errors, etc.)

## 🔧 Development Setup

### Prerequisites

- Bash 4.0 or higher
- Standard Unix tools (`find`, `sort`, `awk`, `stat`)
- Git for version control

### Local Development

```bash
# Clone your fork
git clone https://github.com/yourusername/pdf-finder-script.git
cd pdf-finder-script

# Make executable
chmod +x find_pdfs.sh

# Create a test environment
mkdir test_dir
cd test_dir
# Add some PDF files for testing
cd ..

# Test the script
./find_pdfs.sh

# Run with debug mode
./find_pdfs.sh -d
```

### Code Validation

If available, use `shellcheck` to validate bash code:

```bash
# Install shellcheck (optional but recommended)
# On macOS: brew install shellcheck
# On Ubuntu: apt install shellcheck

# Check the script
shellcheck find_pdfs.sh
```

## 📝 Documentation

When contributing, please update documentation:

- **README.md** - for user-facing changes
- **CHANGELOG.md** - for all changes
- **Code comments** - for complex logic
- **Help text** - for new options

## 🧪 Testing Guidelines

### Test Cases to Consider

- **Empty directories**
- **Directories with no PDFs**
- **Large numbers of files**
- **Files with special characters in names**
- **Permission denied scenarios**
- **Different PDF extensions** (.pdf, .PDF, .Pdf)
- **Symbolic links**
- **Very large files**

### Testing on Different Systems

If possible, test on:
- macOS (latest version)
- Ubuntu/Debian (latest LTS)
- Different bash versions

## 🏷️ Commit Guidelines

### Commit Message Format

```
<type>: <description>

[optional body]

[optional footer]
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

### Examples

```
feat: Add support for custom output directory

fix: Handle files with spaces in names correctly

docs: Update installation instructions for macOS

style: Improve code formatting and comments
```

## 🔄 Pull Request Process

1. **Update documentation** as needed
2. **Add tests** for new functionality
3. **Update CHANGELOG.md** with your changes
4. **Ensure all tests pass**
5. **Request review** from maintainers

### PR Requirements

- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] CHANGELOG.md updated
- [ ] No new warnings or errors

## 📋 Release Process

Releases follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

## 🆘 Getting Help

- **Questions**: Open a [Discussion](https://github.com/sambila/pdf-finder-script/discussions)
- **Issues**: Use [GitHub Issues](https://github.com/sambila/pdf-finder-script/issues)
- **Documentation**: Check [README.md](README.md) and [INSTALL.md](INSTALL.md)

## 🙏 Recognition

Contributors are recognized in:
- Release notes
- CHANGELOG.md
- Project README (for significant contributions)

Thank you for contributing to make PDF Finder Script better! 🎉