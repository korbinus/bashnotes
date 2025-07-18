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

OUTPUT_DIR="$1"

mkdir $OUTPUT_DIR
mkdir $OUTPUT_DIR/$ONE
mkdir $OUTPUT_DIR/$TWO
mkdir $OUTPUT_DIR/$THREE
mkdir $OUTPUT_DIR/refs