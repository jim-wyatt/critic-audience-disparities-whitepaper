# Release Strategy

This project uses **GitHub Releases** for PDF distribution instead of committing binary files to the repository.

## Architecture

```
Source Control (Git)          GitHub Actions              GitHub Services
─────────────────────         ───────────────             ────────────────
                                                          
source/whitepaper.tex ───┬──> build.yml (CI)            ┌─> Artifacts (ephemeral)
                         │    • Every push/PR           │   
                         │    • Verify compilation      │
                         │                              │
                         └──> release.yml               └─> Releases (permanent)
                              • On git tag                  • whitepaper.pdf
                              • Build + release             • Versioned
                              • Attach PDF                  • Public download
                                    │
                                    ↓
                              GitHub Pages
                              • docs/index.html
                              • Links to latest release
```

## Workflows

### 1. build.yml - Continuous Integration
**Triggers:** Every push/PR to main  
**Purpose:** Verify LaTeX compilation  
**Output:** Ephemeral artifact (7 days retention)

### 2. release.yml - Release Automation
**Triggers:** Every push to main OR git tags (v*)  
**Purpose:** Create versioned release with PDF  
**Output:** Permanent release asset  
**Versioning:** Auto-increments (v1.0.N) or uses tag version

### 3. pages.yml - GitHub Pages
**Triggers:** Every push to main  
**Purpose:** Deploy landing page  
**Output:** Live site with download link to latest release

## Creating a Release

### Automatic (Default)
```bash
# Just push to main - automatic release created
git add .
git commit -m "Update content"
git push origin main

# Actions will:
# 1. Install XeLaTeX
# 2. Run scripts/build.sh
# 3. Create GitHub Release (v1.0.N)
# 4. Attach output/whitepaper.pdf
```

### Manual Version Tag (For Major Releases)
```bash
# Tag and push - uses your version number
git tag -a v2.0.0 -m "Major revision: expanded dataset"
git push origin v2.0.0

# Actions will create release with your tag
```

### Manual via GitHub UI
```bash
# Build locally
bash scripts/build.sh

# Create release via GitHub UI
# 1. Go to Releases → Draft new release
# 2. Create tag: v1.0.0
# 3. Upload output/whitepaper.pdf
# 4. Publish
```

## Version Numbering

Follow **Semantic Versioning** for academic papers:

- **v1.0.0** - Initial publication-ready version
- **v1.1.0** - Minor revisions (typos, formatting, minor clarifications)
- **v2.0.0** - Major revisions (methodology changes, new data, substantial content updates)

Examples:
```
v1.0.0  - Initial release
v1.0.1  - Fix typo in reference
v1.1.0  - Add supplementary appendix
v2.0.0  - Expand dataset from 8K to 15K reviews
```

## Download URLs

### Latest Release (Always Current)
```
https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/releases/latest/download/whitepaper.pdf
```

### Specific Version
```
https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/releases/download/v1.0.0/whitepaper.pdf
```

## Benefits

✅ **No binary files in git** - Smaller repo, cleaner history  
✅ **Automated builds** - Ensures PDF matches source  
✅ **Versioning built-in** - Track paper revisions  
✅ **Release notes** - Document changes per version  
✅ **Permanent URLs** - Stable links for citations  
✅ **CI/CD verification** - Catch LaTeX errors before release

## Updating Documentation

When making substantial changes:

1. Update source/whitepaper.tex
2. Update CHANGELOG.md
3. Commit and push to main
4. Create new version tag
5. GitHub Actions handles the rest

## First Release Checklist

- [ ] Push initial commit to main
- [ ] Verify build.yml passes (check Actions tab)
- [ ] Create v1.0.0 tag: `git tag -a v1.0.0 -m "Initial release"`
- [ ] Push tag: `git push origin v1.0.0`
- [ ] Verify release.yml creates release
- [ ] Download PDF from releases page
- [ ] Test GitHub Pages download button
- [ ] Update CHANGELOG.md with release notes

## Troubleshooting

**Release workflow doesn't trigger:**
- Ensure tag starts with 'v' (e.g., v1.0.0)
- Check Actions tab for error messages
- Verify GITHUB_TOKEN has contents: write permission

**PDF build fails in CI:**
- Run `bash scripts/build.sh` locally first
- Check LaTeX compilation errors
- Ensure all packages are in texlive-xetex/texlive-latex-extra

**Download link 404:**
- Wait 2-3 minutes for release to complete
- Check https://github.com/YOUR_USERNAME/critic-audience-disparities-whitepaper/releases
- Verify PDF was attached to release

## CI/CD Best Practices

- **Always test locally first:** `bash scripts/build.sh`
- **Use draft releases** for pre-publication review
- **Tag after merge** to ensure clean history
- **Document breaking changes** in release notes
- **Keep CHANGELOG.md updated** for transparency
