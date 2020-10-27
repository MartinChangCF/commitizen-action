#!/bin/bash

INPUT_BRANCH=${INPUT_BRANCH:-master}

set -e

echo "Running cz check $INPUT_BRANCH"
cz check --rev-range $INPUT_BRANCH

echo "Done."
