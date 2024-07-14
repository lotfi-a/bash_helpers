#!/bin/bash

ROOT="$HOME/helpers"

ALIASES="$ROOT/aliases"
BASE="$ROOT/base"
SCRIPTS="$ROOT/scripts"

#ALIASES
source "$ALIASES/bash.sh"

#BASE
source "$BASE/colors.sh"

#SCRIPTS
source "$SCRIPTS/move.sh"
source "$SCRIPTS/src.sh"