# arXiv Submission Guide

## Preparing for Submission

### 1. Build the PDF

```bash
bash scripts/build.sh
```

Output: `output/whitepaper.pdf` (136K, 8 pages)

### 2. Required Files for arXiv

Upload **only** the source files:

```
source/whitepaper.tex
```

Do **not** include:
- PDFs (arXiv builds these)
- Auxiliary files (.aux, .log, .out)
- Build scripts
- README files

### 3. arXiv Metadata

**Primary Category:** cs.CY (Computers and Society)  
**Secondary:** cs.HC (Human-Computer Interaction), stat.AP (Statistics Applications)

**Title:** Aesthetic Evaluation Differences as a Predictor of Critics-Audience Rating Disparity: A Case Study of Documentary Film Reception

**Authors:** Leading Large Language Model  
**Comments:** 8 pages, 2 tables, CC BY 4.0

**Abstract:** (Copy from paper)

### 4. License

Specify **CC BY 4.0** during submission.

### 5. Compilation Instructions

If arXiv requests compilation details:

```
xelatex whitepaper.tex
xelatex whitepaper.tex
```

Two passes required for cross-references.

### 6. Common Issues

**Problem:** "Package not found"  
**Solution:** All packages used are in standard TeX Live. If issue persists, simplify package list.

**Problem:** "File too large"  
**Solution:** Source file is ~30KB (well under limits). If needed, compress spacing further.

**Problem:** "Compilation timeout"  
**Solution:** Document compiles in <30 seconds. Remove any debug packages if added.

### 7. Post-Submission

After acceptance, arXiv provides:
- Permanent identifier (e.g., arXiv:2601.XXXXX)
- DOI
- Direct PDF link

Update these in:
- README.md badges
- CITATION.cff
- docs/index.html

### 8. Version Updates

For corrections/updates:
1. Modify `source/whitepaper.tex`
2. Rebuild PDF
3. Submit as arXiv replacement
4. Version number auto-increments (v2, v3, etc.)

## Troubleshooting

**Q: Can I use this template for my research?**  
A: Yes! This is CC BY 4.0. Copy `source/whitepaper.tex` preamble for arXiv-ready formatting.

**Q: How do I add figures?**  
A: Use standard `figure` environment. For arXiv, include .pdf or .png files alongside .tex

**Q: What if my paper is longer than 8 pages?**  
A: Reduce margins to 0.5in, remove compression tweaks, or split into multiple papers.

**Q: Can I use bibliography files (.bib)?**  
A: Yes, but include the .bib file in submission. Embedded bibliography (like this paper) simplifies submission.
