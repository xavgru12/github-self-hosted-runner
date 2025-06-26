#!/bin/bash

source define

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "$REPOSITORY_API_URL/actions/workflows/ci.yml/dispatches" \
  -d "{\"ref\":\"$1\"}"

