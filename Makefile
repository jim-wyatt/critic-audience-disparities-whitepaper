.PHONY: help build clean watch view verify install-deps setup

# Default target
help:
	@echo "Whitepaper Build System"
	@echo "======================="
	@echo ""
	@echo "Available targets:"
	@echo "  make build       - Build the PDF (default)"
	@echo "  make clean       - Remove build artifacts"
	@echo "  make view        - Build and open PDF"
	@echo "  make watch       - Rebuild on source changes (requires watchmedo)"
	@echo "  make verify      - Check build without output"
	@echo "  make install-deps - Install build dependencies"
	@echo "  make setup       - Full setup (install deps + build)"
	@echo ""
	@echo "Examples:"
	@echo "  make build       # Compile whitepaper.pdf"
	@echo "  make clean       # Remove temporary files"
	@echo "  make view        # Build and view in PDF reader"

# Build the PDF
build:
	@echo "Building whitepaper..."
	@bash scripts/build.sh
	@echo "✓ Build complete!"

# Clean up artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -f output/*.aux output/*.log output/*.out output/*.toc output/*.fls output/*.fdb_latexmk output/*.synctex.gz output/*.xdv
	@echo "✓ Cleaned!"

# Clean everything including PDF
distclean: clean
	@echo "Removing PDF output..."
	@rm -f output/whitepaper.pdf
	@echo "✓ Complete clean done!"

# Build and view PDF
view: build
	@echo "Opening PDF..."
	@if command -v xdg-open &> /dev/null; then \
		xdg-open output/whitepaper.pdf; \
	elif command -v open &> /dev/null; then \
		open output/whitepaper.pdf; \
	else \
		echo "Please open output/whitepaper.pdf manually"; \
	fi

# Watch for changes and rebuild
watch:
	@if command -v watchmedo &> /dev/null; then \
		watchmedo shell-command \
			--patterns="*.tex" \
			--recursive \
			--command='make build' \
			.; \
	else \
		echo "watchmedo not found. Install with: pip install watchdog[watchmedo]"; \
		exit 1; \
	fi

# Verify build works without verbose output
verify:
	@bash scripts/build.sh > /dev/null 2>&1
	@if [ -f output/whitepaper.pdf ]; then \
		echo "✓ Build verification passed"; \
		du -h output/whitepaper.pdf; \
	else \
		echo "✗ Build verification failed"; \
		exit 1; \
	fi

# Install build dependencies
install-deps:
	@echo "Installing build dependencies..."
	@if command -v apt-get &> /dev/null; then \
		echo "Detected Debian/Ubuntu system..."; \
		sudo apt-get update; \
		sudo apt-get install -y texlive-xetex texlive-latex-extra texlive-fonts-recommended; \
	elif command -v brew &> /dev/null; then \
		echo "Detected macOS system..."; \
		brew install --cask mactex; \
	elif command -v pacman &> /dev/null; then \
		echo "Detected Arch Linux system..."; \
		sudo pacman -S texlive-xetex texlive-latexextra; \
	elif command -v dnf &> /dev/null; then \
		echo "Detected Fedora/RHEL system..."; \
		sudo dnf install texlive-xetex texlive-latex-extra; \
	else \
		echo "Unable to detect package manager"; \
		echo "Please install XeLaTeX manually"; \
		exit 1; \
	fi
	@echo "✓ Dependencies installed!"

# Setup: install deps and build
setup: install-deps build
	@echo "✓ Setup complete!"

# Default action when just typing 'make'
.DEFAULT_GOAL := help
