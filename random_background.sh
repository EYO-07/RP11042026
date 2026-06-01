#!/bin/bash

# random_background.sh
# Seleciona backgrounds aleatórios continuamente.

BACKGROUND_DIRECTORY="$HOME/Pictures/Backgrounds"

while true; do

    # I := Se o diretório existir e não estiver vazio
    if [ -d "$BACKGROUND_DIRECTORY" ] && \
       [ -n "$(find "$BACKGROUND_DIRECTORY" -type f 2>/dev/null)" ]; then

        # R := Seleciona aleatoriamente uma imagem como background
        RANDOM_BACKGROUND="$(find "$BACKGROUND_DIRECTORY" -type f | shuf -n 1)"

        feh --bg-fill "$RANDOM_BACKGROUND"

    fi

    # S := Pause por 10 minutos
    sleep 600

done