#!/bin/bash
# One-time setup for permanent free hosting (GitHub + Netlify).
# Run after: gh auth login   and   netlify login

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

echo "=== Shree Shiksha Academy — permanent deploy ==="
echo ""

if ! gh auth status >/dev/null 2>&1; then
  echo "Step 1: Log into GitHub (browser opens once)"
  gh auth login --web --git-protocol https
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "Step 2: Create GitHub repo and push"
  gh repo create shree-shiksha-academy --public --source=. --remote=origin --push
else
  echo "Step 2: Push to GitHub"
  git push -u origin main
fi

echo ""
echo "Step 3: Deploy on Netlify"
if ! netlify status >/dev/null 2>&1; then
  echo "Log into Netlify (browser opens once)"
  netlify login
fi

netlify init --manual || netlify deploy --prod --dir=.

echo ""
echo "Done. Add your Netlify URL to Google Maps → Add website."
