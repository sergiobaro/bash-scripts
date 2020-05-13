#!/bin/sh

set -x

git reset --hard HEAD
git checkout develop
git pull
git branch -d "$1"
git checkout "$1"
git pull
