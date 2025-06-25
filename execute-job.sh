#!/bin/bash

DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
CURRENT_UPSTREAM_BRANCH=$(git rev-parse --abbrev-ref @{u} | cut -d/ -f2-)

"$DIR/trigger-job.sh" $CURRENT_UPSTREAM_BRANCH
"$DIR/start-runner.sh"

