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

if [ "${#@}" -lt 3 ]; then
  echo "Usage: $0 <parameter> <destination_folder> <template_file_path>"
  exit 1
fi
# Parameters 
ARGS=("$@")
PARAMETER="${ARGS[0]}"
DESTINATION_FOLDER="${ARGS[1]}"
SOURCE_FILE="${ARGS[2]}"

# Variables 
DATE=$(date +%Y-%m-%d)
PARAMETER_FILE=$(echo "$PARAMETER" | tr ' ' '_')
DESTINATION_FILE="${DESTINATION_FOLDER}/${DATE}_${PARAMETER_FILE}.md"

# Create domain folder if it doesn't exist already
if ! [ -d "$DESTINATION_FOLDER" ]; then
  DOMAIN="${DESTINATION_FOLDER#*/$DOMAINS/}"
  DOMAIN="${DOMAIN%%/*}"

  read -p "Domain $DOMAIN does not exist. Do you want to create it ? (Y/[N])" response
  response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
  if [[ -z "$response" || "$response" != "y" ]]; then
    exit 0
  fi

  ./new/domain.sh "$DOMAIN"
fi

# Copy the template into the new note
cp "$SOURCE_FILE" "$DESTINATION_FILE"
if [ $? -ne 0 ]; then
  echo "Error occurred while copying the file. Exiting."
  exit 1
fi

# Replace "Title" with parameter in the first line of the file
if [ "$(uname)" == "Darwin" ]; then
    sed -i '' -E "1s/Title/${PARAMETER}/" "$DESTINATION_FILE"
else
    sed -i "s/Title/${PARAMETER}/" "$DESTINATION_FILE"
fi
if [ $? -ne 0 ]; then
  echo "Error occurred while creating the file. Exiting."
  exit 1
fi

# Open the file in Emacs
$EDITOR "$DESTINATION_FILE"
