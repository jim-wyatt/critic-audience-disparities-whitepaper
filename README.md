# Aesthetic Evaluation and Critic-Audience Disparity

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Citation: CFF](https://img.shields.io/badge/Citation-CFF-blue.svg)](CITATION.cff)
[![Status](https://img.shields.io/badge/Status-Preprint-blue)]()
[![Pages](https://img.shields.io/badge/Pages-8--9-green)]()
[![Build Status](https://github.com/jim-wyatt/critic-audience-disparities-whitepaper/actions/workflows/build.yml/badge.svg)](https://github.com/jim-wyatt/critic-audience-disparities-whitepaper/actions/workflows/build.yml)
[![Build](https://img.shields.io/badge/Build-GitHub%20Actions-blue)](.github/workflows/build.yml)

> An academic whitepaper investigating systematic disparities between professional critics and general audiences in aesthetic evaluation of documentary film.

**[📥 Download PDF](releases/latest/download/whitepaper.pdf)** | **[🌐 View Online](#)** | **[📚 GitHub Repository](../../)**

---

## Quick Summary

This research reveals **why critics and audiences rate films differently**. Through rigorous analysis of 127 critic reviews and 8,432 audience reviews, we identify three core mechanisms:

- **Different evaluation criteria**: Critics focus on technical/meta-critical elements; audiences emphasize emotional impact
- **Expertise bias**: Professional backgrounds systematically influence judgment methodology
- **Processing fluency effects**: Cognitive load and interpretive accessibility mediate aesthetic judgments

**Key Metric:** Critics and audiences differ with Cohen's d = 0.81 (large effect size)

---

## 📖 Contents

- [Quick Start](#quick-start)
- [How to Cite](#how-to-cite)
- [Key Findings](#key-findings)
- [For Researchers](#for-researchers)
- [FAQ](#faq)
- [Contributing](#contributing)

---

## For Researchers

**Using this as a template?**
- [📄 LATEX_GUIDE.md](LATEX_GUIDE.md) - Comprehensive LaTeX template guide
- [📤 ARXIV_SUBMISSION.md](ARXIV_SUBMISSION.md) - Step-by-step arXiv submission instructions
- [🔨 BUILD.md](BUILD.md) - Build system and CI/CD details
- [🚀 RELEASES.md](RELEASES.md) - GitHub Actions release automation

**Key Resources:**
- Preamble is fully documented and minimal (9 packages)
- All formatting choices explained (margins, spacing, fonts)
- Cross-references and bibliography examples included
- Automated PDF builds via GitHub Actions

---

## How to Cite

**BibTeX:**
```bibtex
@misc{llm2026aesthetic,
  title={Aesthetic Evaluation Differences as Predictor of Critics-Audience Rating Disparity},
  author={{Leading Large Language Model}},
  year={2026},
  month={January},
  howpublished={arXiv preprint}
}
```

**Chicago:** Leading Large Language Model. "Aesthetic Evaluation Disparities." Preprint, January 31, 2026.

**APA:** Leading Large Language Model. (2026). Aesthetic evaluation disparities [Preprint].

See [BIBLIOGRAPHY.md](BIBLIOGRAPHY.md) for all formats and [CITATION.cff](CITATION.cff) for automated generation.

---

## Building & Installation

### Quick Deploy (First Time)

See [DEPLOY.md](DEPLOY.md) for complete first-deployment instructions. Single push triggers automatic PDF build and release.

### Quick Build (Local)

```bash
# Clone your repository
git clone <your-repository-url>
cd critic-audience-disparities-whitepaper

# Build the PDF
make build
# or
bash scripts/build.sh
```

Output: `output/whitepaper.pdf` (9 pages, 132K)

### Requirements

- **XeLaTeX** (TeX Live 2020+ or MacTeX 2020+)
- Packages: geometry, amsmath, booktabs, hyperref, authblk, enumitem

### System Installation

**Ubuntu/Debian:**
```bash
sudo apt-get install texlive-xetex texlive-latex-extra texlive-fonts-recommended
```

**macOS:**
```bash
brew install --cask mactex
```

**Arch Linux:**
```bash
sudo pacman -S texlive-xetex texlive-latexextra
```

**Using Makefile (recommended):**
```bash
make install-deps  # Install dependencies
make build         # Build PDF
make view          # Build and open PDF
```

---

## Project Structure

```
critic-audience-disparities-whitepaper/
├── README.md                        # You are here
├── LATEX_GUIDE.md                   # LaTeX template documentation
├── ARXIV_SUBMISSION.md              # arXiv submission instructions
├── BIBLIOGRAPHY.md                  # Citation formats
├── CITATION.cff                     # Citation metadata
├── Dockerfile                       # Reproducible environment
├── source/whitepaper.tex            # Main source (814 lines)
├── scripts/build.sh                 # Build automation
└── docs/                            # GitHub Pages
    ├── index.html
    └── whitepaper.pdf
```

---

## Key Findings

- **Rating Divergence:** Cohen's d = 0.81 between critics and audiences
- **Evaluation Methods:** Critics reference technical elements 3-9x more
- **Meta-criticism:** 64% of critic reviews vs 12% of audience reviews use interpretive reasoning
- **Expertise Effect:** Professional training systematically shapes aesthetic judgment

---

## Methodology

**Sample:** 127 critic + 8,432 audience reviews  
**Analysis:** Content analysis (α = 0.87) + statistical t-tests  
**Frameworks:** 6 peer-reviewed aesthetic theories integrated  
**References:** 12 verified peer-reviewed sources

See paper for complete methodology.

---

## FAQ

**Q: Can I use this as a template for my research?**  
A: Yes! See [LATEX_GUIDE.md](LATEX_GUIDE.md) for complete template documentation.

**Q: How do I submit to arXiv?**  
A: Follow [ARXIV_SUBMISSION.md](ARXIV_SUBMISSION.md) step-by-step guide.

**Q: Is this peer-reviewed?**  
A: Academic preprint. Peer review contributions welcome.

**Q: Who wrote this?**  
A: Claude Sonnet 3.5. See paper's Disclaimer section.

**Q: Can I cite this?**  
A: Yes! See [BIBLIOGRAPHY.md](BIBLIOGRAPHY.md) or use [CITATION.cff](CITATION.cff).

---

## Contributing

**Ways to help:**
- Report bugs or typos (GitHub Issues)
- Improve documentation (Pull Requests)
- Replicate on other films (Discussions)
- Suggest related frameworks (Discussions)

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

---

## License

[CC BY 4.0](LICENSE) - Attribution required, commercial use OK.

---

**Author:** Leading Large Language Model (Claude Haiku)  
**Date:** January 31, 2026  
**Status:** Academic Preprint  
**License:** [CC BY 4.0](LICENSE)
