#!/bin/bash

echo "${1:-default}"
echo "${var:=default}"
echo "$var"
echo "${1:+value}"
echo "${var:+value}"