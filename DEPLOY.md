# 🚀 Deployment Guide

This file contains the exact commands for first deployment. After following these steps, the project will be fully live with:
- ✅ GitHub repository
- ✅ Automated PDF release (v1.0.1)
- ✅ GitHub Pages with download link
- ✅ Release history page

---

## Step 1: Initialize Git Repository

```bash
cd /home/sysadmin/critic-audience-disparities-whitepaper
git init
```

## Step 2: Stage All Files

```bash
git add .
```

**What's being committed:**
- Multiple files total
- 0 binary files (PDFs are gitignored)
- Documentation files
- GitHub Actions workflows (to be created)
- 1 LaTeX source file
- 1 build script

## Step 3: Create Initial Commit

```bash
git commit -m "Initial commit: Academic whitepaper on critic-audience aesthetic evaluation disparities

- 9-page arXiv-ready whitepaper
- Automated PDF builds via GitHub Actions
- Release automation on every push
- GitHub Pages deployment
- Comprehensive LaTeX template documentation"
```

## Step 4: Add Remote and Push

```bash
# Update the URL below with your actual GitHub repository URL
git remote add origin https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper.git
git branch -M main
git push -u origin main
```

---

## What Happens Next (Automatic)

### GitHub Actions will trigger 3 workflows:

1. **Build PDF** (build.yml)
   - Installs XeLaTeX
   - Compiles whitepaper.tex
   - Creates artifact
   - Duration: ~2 minutes

2. **Build and Release** (release.yml)
   - Installs XeLaTeX
   - Compiles whitepaper.tex
   - Creates release v1.0.1
   - Attaches whitepaper.pdf
   - Duration: ~2 minutes

3. **Deploy GitHub Pages** (pages.yml)
   - Deploys docs/ folder
   - Makes site live
   - Duration: ~1 minute

---

## Verification Steps (After 3-4 Minutes)

### 1. Check Actions
```
https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/actions
```
All workflows should show green checkmarks ✅

### 2. Check Release
```
https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/releases
```
Should see initial release with whitepaper.pdf attached

### 3. Download PDF
```
https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/releases/latest/download/whitepaper.pdf
```
Should download ~132KB PDF (9 pages)

### 4. Visit GitHub Pages
```
https://YOUR_USERNAME.github.io/critic-audience-disparities-whitepaper/
```
Should show landing page with GitHub repository link

### 5. Verify Pages Settings
```
https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/settings/pages
```
Source should be: **GitHub Actions** ✅

---

## Troubleshooting

### If release.yml fails:
- Check Actions logs for XeLaTeX errors
- Verify `scripts/build.sh` is executable
- Ensure `source/whitepaper.tex` compiles locally

### If pages.yml fails:
- Check that `docs/` folder exists
- Verify Pages is enabled in settings
- Ensure workflow has `pages: write` permission

### If PDF download 404s:
- Wait 2-3 minutes for release to complete
- Check releases page manually
- Verify release.yml completed successfully

---

## Post-Deployment Configuration

### Add Repository Description
Go to: https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/settings

**Description:**
```
Academic whitepaper investigating critic-audience rating disparities through aesthetic evaluation theory. 9-page LaTeX template for arXiv submission.
```

**Website:**
```
https://YOUR_USERNAME.github.io/critic-audience-disparities-whitepaper/
```

**Topics:**
```
latex arxiv academic-paper whitepaper template xelatex documentary aesthetic-theory github-actions
```

### Optional Features
- [ ] Enable Discussions (for academic discourse)
- [ ] Enable Wiki (for expanded documentation)
- [ ] Add collaborators (if team project)

---

## Future Updates

Every push to `main` will automatically:
1. Create a new release (v1.0.2, v1.0.3, etc.)
2. Build fresh PDF
3. Update GitHub Pages

For major versions, use git tags:
```bash
git tag -a v2.0.0 -m "Major revision: expanded dataset"
git push origin v2.0.0
```

---

**Current Status:** Ready for deployment ✅  
**Last Updated:** 2026-01-31  
**Next Step:** Run commands in Step 1 above
