#!/bin/bash

# arguments handling
if [ $# -eq 0 ]; then
  echo "No commit message provided."
  exit 1
fi

commit_message="$*"

# list changes made
echo "Changes to be committed:"
git status

# promt user to continue
read -p "Do you want to proceed with the commit? (press Enter to continue, 'n' to cancel): " proceed

# dont continue
if [[ $proceed =~ ^[nN] ]]; then
  echo "Commit cancelled."
  exit 0
fi

# update
git add .
git commit -m "$commit_message"
git push
