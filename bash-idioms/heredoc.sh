#!/usr/bin/env bash

cat << ADDTEXT
$PWD
$(whoami)
ADDTEXT

cat << "ADDTEXT"
$PWD
$(whoami)
ADDTEXT

cat <<-ADDTEXT # - removes tabs (and only tabs)
    $PWD
    $(whoami)
ADDTEXT