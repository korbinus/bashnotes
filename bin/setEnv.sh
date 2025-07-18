#!/bin/bash

# Copyright (c) 2025 Mickael Graf (korbinus at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
#     Free Software Foundation
#     51 Franklin Street, 5th Floor
#     Boston, MA 02110-1301 USA

CONFIG_FILE="config.txt"

# Vérifier si le fichier de configuration existe
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Erreur : Le fichier de configuration '$CONFIG_FILE' est introuvable."
    exit 1
fi

export ONE="1_$NOTES"
export TWO="2_$REFLECTIONS"
export THREE="3_$SYNTHESIS"
