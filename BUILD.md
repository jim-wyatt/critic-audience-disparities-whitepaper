# Building Instructions

This document provides detailed instructions for building the whitepaper PDF from source.

## Prerequisites

You need XeLaTeX installed on your system.

### Linux (Ubuntu/Debian)

```bash
sudo apt-get update
sudo apt-get install texlive-xetex texlive-latex-extra texlive-fonts-recommended
```

### macOS (Homebrew)

```bash
brew install --cask mactex
```

If Homebrew is not installed, install it from https://brew.sh

### macOS (Alternate - MacPorts)

```bash
sudo port install texlive +universal
```

### Windows (MiKTeX)

Download and install from https://miktex.org/download

Or use WSL (Windows Subsystem for Linux) with the Ubuntu instructions above.

### Arch Linux

```bash
sudo pacman -S texlive-core texlive-latexextra texlive-xetex
```

### Fedora/RHEL

```bash
sudo dnf install texlive-xetex texlive-latex-extra
```

## Building the PDF

### Quick Build

```bash
cd /path/to/critic-audience-disparities-whitepaper
bash scripts/build.sh
```

Output: `output/whitepaper.pdf`

### Manual Build

```bash
cd source/
xelatex -interaction=nonstopmode -output-directory=../output whitepaper.tex
xelatex -interaction=nonstopmode -output-directory=../output whitepaper.tex
cd ../output/
```

The two-pass compilation ensures cross-references and bibliography are correctly resolved.

### Verification

After building, verify the PDF exists and has reasonable size:

```bash
ls -lh output/whitepaper.pdf
# Should be ~130-140 KB
```

View the PDF:

```bash
# macOS
open output/whitepaper.pdf

# Linux with default viewer
xdg-open output/whitepaper.pdf

# Or use your preferred PDF viewer (Adobe Reader, Evince, Preview, etc.)
```

## Troubleshooting

### "Command not found: xelatex"

**Solution:** XeLaTeX is not installed or not in your PATH. Install it using the appropriate instructions above for your OS.

### "Cannot find output directory"

**Solution:** Run the build script from the repository root, not from inside the `source/` directory.

### PDF is blank or garbled

**Solution:** This can happen if the build was interrupted. Clean auxiliary files and rebuild:

```bash
rm -f output/*.aux output/*.log output/*.out
bash scripts/build.sh
```

### Build succeeds but PDF has wrong content

**Solution:** Ensure you're on the latest version of the source files:

```bash
git pull origin main
bash scripts/build.sh
```

## Development Build

For iterative development with faster builds:

```bash
# Single-pass build (faster, fewer features)
cd source/
xelatex -interaction=batchmode whitepaper.tex
cd ..
```

Note: Single-pass builds may have incorrect cross-references. Always use the full two-pass build before finalizing.

## Output Files

The build process generates several files in `output/`:

- `whitepaper.pdf` - Final compiled document
- `whitepaper.aux` - Auxiliary file (can be deleted)
- `whitepaper.log` - Build log
- `whitepaper.out` - PDF outline
- `whitepaper.toc` - Table of contents (internal)

The build script automatically cleans up the `.aux`, `.log`, `.out`, and `.toc` files after successful completion.

## File Organization

```
critic-audience-disparities-whitepaper/
├── source/
│   └── whitepaper.tex      # Main LaTeX source
├── output/
│   └── whitepaper.pdf      # Compiled PDF (generated)
└── scripts/
    └── build.sh            # Build automation
```

## Continuous Integration

To set up automated builds on each commit:

```bash
# This would typically be handled by GitHub Actions, 
# but can be set up manually with pre-commit hooks
```

See the GitHub Actions documentation for setting up automated builds.
