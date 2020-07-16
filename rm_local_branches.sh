#!/bin/sh

current_branch=`git rev-parse --abbrev-ref HEAD`
git for-each-ref refs/heads --format '%(refname:short)' | grep -v master | grep -v develop | grep -v "$current_branch" | xargs git branch -D