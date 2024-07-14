#!/bin/bash

src() {
    local EMOJI="✅"
    source "$HOME/.zshrc"
    
    if [ $? -eq 0 ]; then
        echo -e "${EMOJI} ${GREEN}Le fichier '.zshrc' a été sourcé avec succès.${RESET}"
    else
    local EMOJI="🔞"
        echo -e "${EMOJI} ${RED}Erreur lors du sourcing du fichier '.zshrc'.${RESET}"
    fi
}