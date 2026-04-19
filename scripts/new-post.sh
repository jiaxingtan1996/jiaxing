#!/usr/bin/env bash
set -euo pipefail

CATEGORY="${1:-machine-learning}"

if [[ "$CATEGORY" != "machine-learning" && "$CATEGORY" != "references" ]]; then
  echo "Category must be machine-learning or references"
  exit 1
fi

read -rp "Post title: " TITLE

SLUG=$(echo "$TITLE" \
  | tr '[:upper:]' '[:lower:]' \
  | sed 's/[^a-z0-9]/-/g' \
  | sed 's/-\+/-/g' \
  | sed 's/^-//' \
  | sed 's/-$//')

TODAY=$(date +%F)
FILE="src/content/posts/${SLUG}.mdx"

if [[ -f "$FILE" ]]; then
  echo "File already exists: $FILE"
  exit 1
fi

cat > "$FILE" <<POST
---
title: $TITLE
description: Write a one-line summary here.
pubDate: $TODAY
category: $CATEGORY
tags:
  - note
---

Start writing here.
POST

echo "Created $FILE"
