#!/bin/bash

# Simple wrapper over awk to print a specific column

[[ $1 =~ ^[0-9]+$ ]] || exit 1 # Enforce input is a number
exitIfError "$?" "Input expected to be number" || exit 1

cmd="awk '{print "'$'"$1}'"
eval "$cmd"

