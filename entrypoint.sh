#!/bin/bash

firstcommit=`git rev-list --max-parents=0 HEAD`

if [ -z "${INPUT_RANGE}" ]; then 
    INPUT_RANGE=${firstcommit}..HEAD
else 
    INPUT_RANGE=${INPUT_RANGE}
fi

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