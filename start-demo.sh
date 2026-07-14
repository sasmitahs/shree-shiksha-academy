#!/bin/bash
# Free live demo — no GitHub, Netlify, or payment needed.
# Keeps running until you press Ctrl+C.

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
PORT="${PORT:-8765}"

echo "Starting Shree Shiksha Academy demo..."
echo ""

# Local server
if ! curl -s --max-time 2 "http://localhost:$PORT/" >/dev/null 2>&1; then
  echo "→ Local server on http://localhost:$PORT"
  python3 -m http.server "$PORT" --directory "$DIR" &
  SERVER_PID=$!
  sleep 1
else
  echo "→ Reusing server on http://localhost:$PORT"
  SERVER_PID=""
fi

# Public tunnel (free, no account)
if command -v cloudflared >/dev/null 2>&1; then
  echo "→ Creating public link (free, no signup)..."
  echo ""
  cloudflared tunnel --url "http://localhost:$PORT" 2>&1 | while IFS= read -r line; do
    echo "$line"
    echo "$line" | grep -q 'trycloudflare.com' && echo "" && echo "Share the link above with parents/customers."
  done
else
  echo "Install cloudflared for a public link: brew install cloudflared"
  echo "Local preview only: http://localhost:$PORT"
  wait
fi

[ -n "$SERVER_PID" ] && kill "$SERVER_PID" 2>/dev/null
