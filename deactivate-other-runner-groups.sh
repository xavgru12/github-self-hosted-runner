#!/bin/bash

source define

curl -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$ORG_API_URL/actions/runner-groups/3" \
  -d '{"allows_public_repositories": false}'

