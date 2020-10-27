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

echo "Running cz check $INPUT_BRANCH"
cz check --rev-range origin/$INPUT_BRANCH..HEAD

echo "Done."
