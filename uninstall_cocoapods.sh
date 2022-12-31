#!/bin/sh

for gem in $( gem list --local --no-version | grep cocoapods); do
    sudo gem uninstall $gem
done