#!/bin/bash

REPOSITORY_API_URL="https://api.github.com/repos/xavgru12/meta-swift-project"
ACTIONS_RUNNER_PATH="/home/xaver/code/actions-runner"
CURRENT_DIRECTORY="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Read token from file
TOKEN=$(<${CURRENT_DIRECTORY}/credentials.txt)

# Get JIT config
JIT_CONFIG=$(curl -sL \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$REPOSITORY_API_URL/actions/runners/generate-jitconfig" \
  -d '{"name":"just in time github runner","runner_group_id":1,"labels":["self-hosted","X64","Linux","no-gpu"],"work_folder":"_work"}' \
  | jq -r '.encoded_jit_config')

# Validate JIT_CONFIG is not empty or broken
if [[ -z "$JIT_CONFIG" || "$JIT_CONFIG" == "null" ]]; then
  echo "❌ Failed to generate JIT config. Make sure the runner does not exist yet. Check your token and repository URL."
  exit 1
fi

# Start the runner
"${ACTIONS_RUNNER_PATH}/run.sh" --jitconfig "$JIT_CONFIG"

