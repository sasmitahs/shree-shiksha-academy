#!/bin/bash
# Run this once — it does GitHub + Netlify deploy for you.
# You only need to approve login in your browser (30 seconds).

set -e
cd "$(dirname "$0")"

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║  Shree Shiksha Academy — free deploy (no payment)    ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# ── GitHub ──
if ! gh auth status >/dev/null 2>&1; then
  echo "① GitHub login — a browser tab will open."
  echo "   Approve access, then come back here."
  echo ""
  gh auth login --hostname github.com --git-protocol https --web
fi
echo "✓ GitHub connected"

if ! git remote get-url origin >/dev/null 2>&1; then
  echo ""
  echo "② Creating repo github.com/sasmitahs/shree-shiksha-academy ..."
  gh repo create shree-shiksha-academy --public --source=. --remote=origin --push
else
  echo ""
  echo "② Pushing to GitHub ..."
  git push -u origin main
fi
echo "✓ Code on GitHub"

# ── Netlify ──
if ! netlify status >/dev/null 2>&1; then
  echo ""
  echo "③ Netlify login — approve in browser when asked."
  netlify login
fi

echo ""
echo "④ Deploying live site ..."
if [ ! -f .netlify/state.json ] 2>/dev/null; then
  netlify sites:create --name shree-shiksha-academy 2>/dev/null || true
  netlify link --name shree-shiksha-academy 2>/dev/null || netlify init --manual
fi

URL=$(netlify deploy --prod --dir=. --message "Shree Shiksha Academy launch" 2>&1 | tee /dev/stderr | grep -Eo 'https://[^ ]+\.netlify\.app' | tail -1)

echo ""
echo "══════════════════════════════════════════════════════"
if [ -n "$URL" ]; then
  echo "  LIVE DEMO: $URL"
else
  echo "  Deploy finished — check URL in output above"
fi
echo "  Share this link with parents. Add it to Google Maps."
echo "══════════════════════════════════════════════════════"
echo ""
