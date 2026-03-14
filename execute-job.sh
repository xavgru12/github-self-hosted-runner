#!/bin/bash

set -e

source define

CURRENT_UPSTREAM_BRANCH=$(git rev-parse --abbrev-ref @{u} | cut -d/ -f2-)

"$CURRENT_DIRECTORY/deactivate-other-runner-groups.sh"
"$CURRENT_DIRECTORY/trigger-job.sh" $CURRENT_UPSTREAM_BRANCH
"$CURRENT_DIRECTORY/start-runner.sh"
#sleep 30
#"$CURRENT_DIRECTORY/activate-other-runner-groups.sh"

