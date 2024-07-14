#!/bin/bash

move() {
    local target=
    local base_dir=
    local closest_dir=

    if [ -z "$2" ]; then
        base_dir="$HOME/"
        target="$1"
    else
        base_dir="$HOME/$1/"
        target="$2"
    fi

    if [[ "$target" == *"/"* ]]; then
        target=$(basename "$target")
    fi

    local dir=$(find "$base_dir" -maxdepth 1 -type d -name "$target" -exec basename {} \;)

    if [ -z "$dir" ]; then
        closest_dir=$(find "$base_dir" -maxdepth 1 -type d -name "*$target*" -printf "%f\n" | head -n 1)
    fi

    if [ -z "$dir" ] && [ -n "$closest_dir" ]; then
        dir="$closest_dir"
    fi

    if [ -z "$dir" ]; then
        local EMOJI="🔞"
        echo -e "${EMOJI} ${RED}Aucun répertoire correspondant à '$target' n'a été trouvé !${RESET}"
        return 1
    fi

    local full_dir="$base_dir$dir"
    if [ -d "$full_dir" ]; then
        cd "$full_dir" || return 1
        
        local EMOJI="🚀"

        echo -e "${EMOJI} Vous êtes maintenant dans le répertoire ${BOLD}${BLUE}$dir !${RESET}"
    else
        local EMOJI="🔞"
        echo -e "${EMOJI} ${RED}Le répertoire '$dir' n'existe pas !${RESET}"
    fi
}