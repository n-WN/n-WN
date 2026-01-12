#!/bin/bash
BASE_URL="https://raw.githubusercontent.com/n-WN/n-WN/metrics"
FILES=(
  "metrics-stats.svg"
  "metrics-langs.svg"
  "metrics-repo-sagemath.svg"
  "metrics-repo-Pwn4Sage.svg"
  "metrics-repo-translate-shell.svg"
  "metrics-repo-share_these.svg"
  "metrics-repo-ctf-wiki.svg"
  "metrics-repo-OI-wiki.svg"
  "metrics-repo-chaoxing.svg"
  "metrics-repo-Hello-CTF.svg"
)

echo "Verifying image accessibility..."
for file in "${FILES[@]}"; do
  url="$BASE_URL/$file"
  code=$(curl -o /dev/null -s -w "%{http_code}\n" "$url")
  if [ "$code" == "200" ]; then
    echo "[OK] $file ($code)"
  else
    echo "[FAIL] $file ($code)"
  fi
done
