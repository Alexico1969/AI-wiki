# 🎓 AI/ML Wiki - MkDocs + GitHub Pages

A beautiful, searchable web interface for your AI/ML knowledge base from Russell & Norvig.

## Quick Start (5 minutes)

### On Your Computer:

**1. Install dependencies**
```bash
pip install mkdocs mkdocs-material
```

**2. Test locally**
```bash
cd wiki-site
mkdocs serve
```
Opens at http://localhost:8000

**3. Create GitHub repo**
- Go to github.com → New Repository
- Name: `ai-ml-wiki`
- Make it Public
- Click Create

**4. Push code**
```bash
cd wiki-site
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/ai-ml-wiki.git
git push -u origin main
```

**5. Enable GitHub Pages**
- Repo Settings → Pages
- Source: Deploy from branch
- Branch: main
- Save

**6. Enable auto-deploy**
Create `.github/workflows/deploy.yml`:
```yaml
name: Deploy Wiki
on:
  push:
    branches: [main]
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

**Your wiki is now live at:**
`https://YOUR_USERNAME.github.io/ai-ml-wiki`

---

## What's Included

✅ 18 concept pages from Russell & Norvig textbook
✅ Beautiful dark/light theme (Material Design)
✅ Full-text search (works offline too!)
✅ Responsive mobile design
✅ Auto-deploy on every git push

---

## Project Structure

```
wiki-site/
├── mkdocs.yml          # Site config & navigation
├── docs/
│   ├── index.md        # Home page
│   ├── concepts/       # Core AI concepts
│   └── references/     # Math & background
├── .gitignore
└── README.md           # This file
```

---

## Updating Your Wiki

Once live, just:
1. Edit markdown files locally
2. Commit: `git commit -am "Update page"`
3. Push: `git push`
4. GitHub Actions auto-deploys (2-3 min)

No manual build needed!

---

## Troubleshooting

**"command not found: mkdocs"**
- Run: `pip install mkdocs mkdocs-material`
- Make sure pip/python3 is in PATH

**Local site won't load**
- Check you're in wiki-site directory
- Run: `mkdocs serve --dev-addr=0.0.0.0:8000`

**GitHub Pages not working**
- Check Settings → Pages has correct source
- Wait 5 min for first deploy
- Check Actions tab for build logs

---

## Next Steps

1. Copy this directory to your machine
2. Install mkdocs: `pip install mkdocs mkdocs-material`
3. Test locally: `mkdocs serve`
4. Create GitHub repo
5. Push code
6. Enable GitHub Pages
7. Share your wiki! 🚀

---

**Made with ❤️ by Jarvis**
