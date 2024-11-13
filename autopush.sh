#!/bin/bash
# This script adds and commits all files in a git repository in batches of 500 files.
# Usage: ./autopush.sh
# Author: Ronan Le Meillat
# Date: 2024_11-12
# License: MIT

# This script was created to avoid an error when trying to add and commit a large number of files in a git repository.

# Check if git repository is initialized
if [ ! -d ".git" ]; then
    echo "This directory is not a git repository."
    exit 1
fi

# Counter for file batches
batch_size=500
counter=0
batch_counter=1

# Function to add and commit files
commit_batch() {
    echo "Adding and committing files batch $batch_counter..."
    git commit -m "Commit batch $batch_counter"
    git push origin main
    batch_counter=$((batch_counter + 1))
}

# Scan files while ignoring those in .gitignore
find . -type f -not -path '*/\.*' | while read -r file; do
  git add "$file"
  counter=$((counter + 1))

  if [ $counter -ge $batch_size ]; then
    commit_batch
    counter=0
  fi
done

# Commit remaining files
if [ $counter -gt 0 ]; then
    commit_batch
fi

echo "All files have been added and pushed in batches of $batch_size."
