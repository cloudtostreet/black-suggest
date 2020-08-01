#!/bin/sh -l

black --diff $GITHUB_WORKSPACE > $HOME/black.patch
python /apply_patches_as_suggestion.py --access-token $1 $2