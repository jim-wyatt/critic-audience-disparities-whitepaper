#!/bin/bash

# LaTeX build script for arXiv-style whitepaper
# Compiles .tex file directly with XeLaTeX

echo "Building whitepaper..."
echo "======================"

# Set paths
SOURCE_DIR="source"
OUTPUT_DIR="output"
TEX_FILE="$SOURCE_DIR/whitepaper.tex"
OUTPUT_PDF="$OUTPUT_DIR/whitepaper.pdf"

# Check if xelatex is available
if ! command -v xelatex &> /dev/null; then
    echo "✗ Error: xelatex not found!"
    echo "Please install XeLaTeX:"
    echo "  Ubuntu/Debian: sudo apt-get install texlive-xetex texlive-latex-extra"
    echo "  macOS: brew install --cask mactex"
    echo "  Arch: sudo pacman -S texlive-xetex texlive-latexextra"
    echo "  Fedora: sudo dnf install texlive-xetex texlive-latex-extra"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Check if source file exists
if [ ! -f "$TEX_FILE" ]; then
    echo "✗ Error: $TEX_FILE not found!"
    exit 1
fi

echo "Compiling LaTeX with XeLaTeX (pass 1/2)..."

# Compile with xelatex (first pass)
cd "$SOURCE_DIR" || exit 1
xelatex -interaction=nonstopmode -output-directory="../$OUTPUT_DIR" whitepaper.tex > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "✗ First pass failed! Running with verbose output..."
    xelatex -interaction=nonstopmode -output-directory="../$OUTPUT_DIR" whitepaper.tex
    cd .. && exit 1
fi

echo "Running second pass for cross-references (pass 2/2)..."
xelatex -interaction=nonstopmode -output-directory="../$OUTPUT_DIR" whitepaper.tex > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "✗ Second pass failed! Running with verbose output..."
    xelatex -interaction=nonstopmode -output-directory="../$OUTPUT_DIR" whitepaper.tex
    cd .. && exit 1
fi

# Return to root directory
cd .. || exit 1

# Verify PDF was created
if [ ! -f "$OUTPUT_PDF" ]; then
    echo "✗ PDF generation failed! File not found at $OUTPUT_PDF"
    exit 1
fi

# Clean up auxiliary files
rm -f "$OUTPUT_DIR"/*.aux "$OUTPUT_DIR"/*.log "$OUTPUT_DIR"/*.out "$OUTPUT_DIR"/*.toc "$OUTPUT_DIR"/*.fls "$OUTPUT_DIR"/*.fdb_latexmk

echo "✓ PDF generated successfully!"
echo "Output: $OUTPUT_PDF"

# Show file size
if command -v du &> /dev/null; then
    SIZE=$(du -h "$OUTPUT_PDF" | cut -f1)
    echo "Size: $SIZE"
fi

echo "======================================"
echo "Build complete!"
exit 0
