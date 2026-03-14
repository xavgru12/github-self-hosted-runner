#!/bin/bash

source define

RUNNER_GROUPS=$(curl -s \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "$ORG_API_URL/actions/runner-groups" \
  | jq -r '.runner_groups[].id')

for GROUP_ID in $RUNNER_GROUPS; do
  if [[ "$GROUP_ID" != $RUNNER_GROUP_ID ]]; then
    echo "Set public runner group $GROUP_ID"

    curl -s -X PATCH \
      -H "Authorization: Bearer $TOKEN" \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "$ORG_API_URL/actions/runner-groups/$GROUP_ID" \
      -d '{"allows_public_repositories": true}' \
      | jq
  else
    echo "Skipping runner group $RUNNER_GROUP_ID"
  fi
done

