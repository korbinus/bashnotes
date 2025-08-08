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

source new/setEnv.sh

# Check if parameter
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

PARAMETER="$1"
DOMAIN=$(echo "$PARAMETER" | tr ' ' '_')

OUTPUT_DIR="$DOMAINS/$DOMAIN"
mkdir -p "$OUTPUT_DIR"/{"$ONE","$TWO","$THREE",refs} || { echo "Error creating domain $1"; exit 1; }
