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

source bin/setEnv.sh

# Check if parameters
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <domain> <subject>"
    exit 1
fi

domain="$1"
subject="$2"

./bin/bashnote.sh "$subject" "./$domain/$THREE" "./templates/summary.md"
