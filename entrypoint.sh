#!/bin/bash

ACCESS_TOKEN=$1
SOURCE_PATH=$2
LINE_LENGTH=$3

black --diff $SOURCE_PATH --line-length $LINE_LENGTH > $HOME/black.patch
python /apply_patches_as_suggestion.py --access-token $ACCESS_TOKEN $HOME/black.patch