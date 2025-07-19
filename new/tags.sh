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

source new/setEnv.sh || { echo "Error sourcing setEnv.sh"; exit 1; }

OUTPUT_DIR="tags"

# Directories to scan, which names are given in config.txt
TARGET_SUBDIRS=( "$ONE" "$TWO" "$THREE" )

# Temporary file for associating tag/file
TEMP_TAGS_FILE=$(mktemp) || { echo "Error creating temporary file."; exit 1; }

# Extracts hashtags from file
extract_hashtags() {
    local file="$1"
    # Get accentuated characters
    LC_ALL=C.UTF-8 grep -oE '#([[:alnum:]_]+)' "$file" | while read -r tag; do
        # We don't want a hexadecimal color code, only tags
        if ! [[ "$tag" =~ ^#[0-9a-fA-F]{3}$ || "$tag" =~ ^#[0-9a-fA-F]{6}$ ]]; then
            echo "$tag"
        fi
    done | tr -d '[:punct:]' | sort -u
}

# Remove temporary file at the end
trap "rm -f $TEMP_TAGS_FILE" EXIT

# Recreate tag directory
if [ -d "$OUTPUT_DIR" ]; then
    rm -rf "$OUTPUT_DIR"
fi
mkdir -p "$OUTPUT_DIR"

# Find tags in all domains and subforlders - one sublevel only
FIND_CONDITIONS=()
for dir_name in "${TARGET_SUBDIRS[@]}"; do
    FIND_CONDITIONS+=( "-o" "-wholename" "*/${dir_name}/*.md" )
done

FIND_ARGS=( "." "-type" "f" -name "*.md" "(" "${FIND_CONDITIONS[@]:1}" ")" )

find "${FIND_ARGS[@]}" -print0 | while IFS= read -r -d $'\0' file; do
    relative_file="${file#./}"
    extracted_tags=$(extract_hashtags "$relative_file")

    for tag in $extracted_tags; do
        echo "${tag}::${relative_file}" >> "$TEMP_TAGS_FILE"
    done
done

LC_ALL=C sort "$TEMP_TAGS_FILE" | uniq | awk -F'::' -v output_dir="$OUTPUT_DIR" '
    BEGIN {
        current_tag = "";
        output_file = "";
    }
    {
        tag = $1;
        file = $2;

        if (tag != current_tag) {
            # New hashtag, close previous opened file, if any
            if (output_file != "") {
                close(output_file);
            }
            current_tag = tag;
            output_file = output_dir "/" tag ".md";
            print "# " tag "\n" > output_file;
        }
        # Add markdown link to current file
        print "- [" file "](../" file ")" >> output_file;
    }
    END {
        # Close previous opened file, if any
        if (output_file != "") {
            close(output_file);
        }
    }
'
