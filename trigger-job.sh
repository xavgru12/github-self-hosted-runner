#!/bin/bash

REPOSITORY_API_URL="https://api.github.com/repos/xavgru12/meta-swift-project"
ACTIONS_RUNNER_PATH="/home/xaver/code/actions-runner"
CURRENT_DIRECTORY="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

TOKEN=$(<${CURRENT_DIRECTORY}/credentials.txt)

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$REPOSITORY_API_URL/actions/workflows/ci.yml/dispatches" \
  -d "{\"ref\":\"$1\"}"

