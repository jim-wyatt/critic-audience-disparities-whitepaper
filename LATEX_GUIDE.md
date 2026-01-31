# LaTeX Template Guide

This document explains the LaTeX structure for easy replication.

## Minimal arXiv-Ready Preamble

```latex
\documentclass[9pt,twocolumn]{article}

% Core packages for arXiv submission
\usepackage[utf8]{inputenc}           % UTF-8 encoding
\usepackage[margin=0.65in]{geometry}  % Page margins
\usepackage[compact]{titlesec}        % Compressed section spacing
\usepackage{amsmath,amssymb}          % Math symbols
\usepackage{booktabs}                 % Professional tables
\usepackage{array,multirow}           % Table enhancements
\usepackage{hyperref}                 % Clickable links
\usepackage{authblk}                  % Author/affiliation formatting
\usepackage{enumitem}                 % List customization

% Link colors (arXiv style)
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    citecolor=blue,
    urlcolor=blue
}

% Compact spacing for 8-page target
\setlength{\parskip}{0pt}
\linespread{0.9}

% Section spacing
\titlespacing*{\section}{0pt}{4pt}{2pt}
\titlespacing*{\subsection}{0pt}{3pt}{1pt}

% Compressed lists
\setlist{nosep, itemsep=0pt}

\begin{document}
\title{Your Title Here}
\author{Your Name}
\date{\today}

\maketitle

\begin{abstract}
Your abstract here.
\end{abstract}

\section{Introduction}
Your content here.

\end{document}
```

## Package Explanations

### Required for Functionality
- `inputenc`: UTF-8 character support (non-ASCII characters)
- `geometry`: Control margins (arXiv prefers 0.5-1 inch)
- `hyperref`: Clickable references (DOI links, citations)

### Quality of Life
- `booktabs`: Professional table rules (`\toprule`, `\midrule`, `\bottomrule`)
- `amsmath`: Math environments (`align`, `equation`)
- `authblk`: Multiple authors with affiliations

### Optional (Safe to Remove)
- `titlesec[compact]`: Only needed if customizing section spacing
- `enumitem`: Only if customizing list spacing

## Space-Saving Techniques

### 1. Two-Column Layout
```latex
\documentclass[twocolumn]{article}  % ~40% space savings
```

### 2. Smaller Font
```latex
\documentclass[9pt]{article}  % vs default 10pt
```

### 3. Tighter Margins
```latex
\usepackage[margin=0.5in]{geometry}  % Aggressive
\usepackage[margin=0.65in]{geometry} % Balanced (used here)
\usepackage[margin=0.75in]{geometry} % Conservative
```

### 4. Compressed Line Spacing
```latex
\linespread{0.9}  % 90% of normal (subtle, effective)
```

### 5. Section Spacing
```latex
\titlespacing*{\section}{0pt}{4pt}{2pt}
%                        ^left  ^before ^after
```

### 6. List Spacing
```latex
\setlist{nosep, itemsep=0pt}  % Remove all list padding
```

## Table Best Practices

### Simple Table
```latex
\begin{table}[h]
\centering
\caption{Your caption}
\begin{tabular}{lrr}
\toprule
Header 1 & Header 2 & Header 3 \\
\midrule
Row 1    & 123      & 456      \\
Row 2    & 789      & 012      \\
\bottomrule
\end{tabular}
\end{table}
```

### Column Specifications
- `l`: Left-aligned text
- `r`: Right-aligned (numbers)
- `c`: Centered
- `p{3cm}`: Fixed-width paragraph

## Common Pitfalls

### ❌ Don't Do This
```latex
\usepackage{times}          % Deprecated, breaks fonts
\usepackage{graphicx}       % Adds unused functionality
\usepackage{float}          % [H] placement causes issues
\usepackage{subfigure}      % Deprecated (use subfig)
```

### ✅ Do This Instead
```latex
% Use only packages you need
% Let LaTeX handle figure placement
% Use modern packages (subfig, not subfigure)
```

## Bibliography Options

### Embedded (Simplest for arXiv)
```latex
\begin{thebibliography}{99}
\bibitem{key1} Author. ``Title.'' \textit{Journal}, Year.
\end{thebibliography}
```

### BibTeX (More Flexible)
```latex
\bibliographystyle{plain}
\bibliography{references}  % references.bib file
```

For arXiv: Include both .tex and .bib files in submission.

## Cross-References

```latex
\section{Introduction}
\label{sec:intro}

As mentioned in Section~\ref{sec:intro}...

\begin{equation}
\label{eq:main}
E = mc^2
\end{equation}

Equation~\ref{eq:main} shows...
```

## Math Environments

### Inline Math
```latex
The result is $x = 5$ for all cases.
```

### Display Math
```latex
\begin{equation}
\frac{a}{b} = c
\end{equation}
```

### Aligned Equations
```latex
\begin{align}
x &= y + z \\
  &= 2 + 3 \\
  &= 5
\end{align}
```

## File Structure Recommendations

```
project/
├── source/
│   ├── paper.tex          # Main document
│   └── sections/          # Optional: split sections
│       ├── intro.tex
│       └── methods.tex
├── scripts/
│   └── build.sh           # Automation
└── output/
    └── paper.pdf          # Compiled result
```

## Build Commands

### Standard Build
```bash
pdflatex paper.tex
pdflatex paper.tex  # Second pass for references
```

### XeLaTeX (Better Unicode/Fonts)
```bash
xelatex paper.tex
xelatex paper.tex
```

### With Bibliography
```bash
pdflatex paper.tex
bibtex paper
pdflatex paper.tex
pdflatex paper.tex
```

## Debugging

### View Full Error Output
```bash
xelatex paper.tex  # Without -interaction=nonstopmode
```

### Common Errors

**Error:** `Undefined control sequence`  
**Fix:** Missing package or typo in command

**Error:** `Missing $ inserted`  
**Fix:** Math symbols outside math mode (wrap in `$...$`)

**Error:** `Package not found`  
**Fix:** Install TeX Live full or check package name

## Reusing This Template

1. Copy `source/whitepaper.tex` preamble (lines 1-50)
2. Replace content between `\begin{document}` and `\end{document}`
3. Adjust margins/spacing for your page target
4. Run `xelatex` twice

Done! You have an arXiv-ready paper.
