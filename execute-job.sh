#!/bin/bash

source define

CURRENT_UPSTREAM_BRANCH=$(git rev-parse --abbrev-ref @{u} | cut -d/ -f2-)

"$CURRENT_DIRECTORY/trigger-job.sh" $CURRENT_UPSTREAM_BRANCH
"$CURRENT_DIRECTORY/start-runner.sh"

