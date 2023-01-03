#!/bin/bash

declare -i SEE

X=9
Y=3

SEE=X+Y # arithmetic operation
SAW=X+Y # string literal
SUM=$X+$Y # string concatenation

echo "SEE: $SEE"
echo "SAW: $SAW"
echo "SUM: $SUM"
