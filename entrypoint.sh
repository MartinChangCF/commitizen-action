#!/bin/bash

INPUT_BRANCH=${INPUT_BRANCH:-master}

set -e

echo "Installing requirements..."
if [[ -f "requirements.txt" ]]; then
    # Ensure commitizen + reqs may have custom commitizen plugins
    pip install -r requirements.txt commitizen
else
    pip install commitizen
fi

echo "Running cz check $INPUT_RANGE"
cz check --rev-range $INPUT_RANGE

echo "Done."
