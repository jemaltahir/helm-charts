#!/usr/bin/env bash
# ============================================================
# setup.sh — Bootstrap your GitHub Helm Chart Registry
# Usage: ./setup.sh <your-github-username> <your-github-repo>
# Example: ./setup.sh johndoe helm-charts
# ============================================================
set -euo pipefail

GITHUB_USER="${1:-YOUR_GITHUB_USERNAME}"
REPO_NAME="${2:-helm-charts}"
REPO_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
PAGES_URL="https://${GITHUB_USER}.github.io/${REPO_NAME}"

echo "================================================"
echo " Helm Chart Registry Bootstrap"
echo " User : $GITHUB_USER"
echo " Repo : $REPO_NAME"
echo " Pages: $PAGES_URL"
echo "================================================"
echo ""

# ── Pre-flight checks ─────────────────────────────────────────────────────────
command -v helm  >/dev/null 2>&1 || { echo "❌ helm not found. Install it: https://helm.sh/docs/intro/install/"; exit 1; }
command -v git   >/dev/null 2>&1 || { echo "❌ git not found."; exit 1; }
echo "✅ helm $(helm version --short) detected"
echo "✅ git  $(git --version) detected"
echo ""

# ── Step 1: initialise git repo ───────────────────────────────────────────────
echo "📁 Step 1 — Initialising git repository…"
git init
git checkout -b main 2>/dev/null || git checkout main
echo ""

# ── Step 2: scaffold the chart under charts/ ─────────────────────────────────
echo "📦 Step 2 — Creating sample chart…"
mkdir -p charts
helm create charts/mychart
echo "✅ charts/mychart created"
echo ""

# ── Step 3: lint ──────────────────────────────────────────────────────────────
echo "🔍 Step 3 — Linting chart…"
helm lint charts/mychart
echo ""

# ── Step 4: first commit ──────────────────────────────────────────────────────
echo "💾 Step 4 — Staging and committing…"
git add .
git commit -m "feat: add mychart v0.1.0"
echo ""

# ── Step 5: remote & push ─────────────────────────────────────────────────────
echo "🚀 Step 5 — Pushing to GitHub…"
git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"
git push -u origin main
echo ""

echo "================================================"
echo " ✅ Done! Next steps:"
echo ""
echo " 1. Enable GitHub Pages:"
echo "    Repo → Settings → Pages"
echo "    Source: GitHub Actions  (or gh-pages branch)"
echo ""
echo " 2. The workflow at .github/workflows/helm-release.yml"
echo "    will auto-publish on every push to charts/**"
echo ""
echo " 3. Once Pages is live, add your repo:"
echo "    helm repo add myrepo $PAGES_URL"
echo "    helm repo update"
echo "    helm search repo myrepo"
echo "    helm install my-release myrepo/mychart"
echo "================================================"