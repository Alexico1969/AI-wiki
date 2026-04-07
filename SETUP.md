# 🚀 Setup Guide - AI/ML Wiki on GitHub Pages

## Prerequisites
- Python 3.7+
- Git
- GitHub account

## Local Setup (Test First)

### 1. Install MkDocs
```bash
pip install mkdocs mkdocs-material
```

### 2. Run Locally
```bash
cd /path/to/wiki-site
mkdocs serve
```
Opens at `http://localhost:8000`

### 3. Build Static Site
```bash
mkdocs build
```
Creates `site/` directory with all HTML files.

---

## GitHub Pages Setup

### 1. Create GitHub Repository
```bash
# Create new repo on GitHub.com
# Name: ai-ml-wiki
# Description: Russell & Norvig AI knowledge base
# Public (required for free Pages)
```

### 2. Initialize Git & Push
```bash
cd /path/to/wiki-site

git init
git add .
git commit -m "Initial commit: AI/ML wiki"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/ai-ml-wiki.git
git push -u origin main
```

### 3. Configure GitHub Pages
1. Go to repo Settings → Pages
2. Source: Deploy from a branch
3. Branch: `main` / folder: `/ (root)`
4. Save

### 4. Enable GitHub Actions (Auto-Deploy)
Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy Wiki

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: 3.9
      - run: pip install mkdocs mkdocs-material
      - run: mkdocs build
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./site
```

### 5. Your Wiki is Live!
Access at: `https://YOUR_USERNAME.github.io/ai-ml-wiki`

---

## Updating the Wiki

### To add new pages:
1. Create `.md` file in `docs/`
2. Add to `mkdocs.yml` nav section
3. Commit and push
4. GitHub Actions auto-deploys (2-3 min)

### To edit existing pages:
1. Edit markdown file
2. Commit and push
3. Site updates automatically

---

## Tips

- **Search**: Built-in, works locally and on live site
- **Dark mode**: Toggle in top-right
- **Mobile friendly**: Works on all devices
- **Offline**: Run `mkdocs serve` anywhere

---

Questions? Check MkDocs docs: https://www.mkdocs.org
