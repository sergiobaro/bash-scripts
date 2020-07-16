#!/bin/sh

if [ -z "$1" ]; then
    echo "Missing target branch: prepare_rebase <target_branch>"
    exit 1
fi

target_branch="$1"

set -ex

git reset --hard HEAD
git checkout develop
git pull
git branch -d "$target_branch" || true 
git checkout "$target_branch"
git pull
