#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Must provide iterations argument."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utilities/load-environment-variables.sh"
load_environment_variables

echo "🚀 Starting Ralph in AFK mode"

for ((i=1; i<=$1; i++)); do
  echo "═══ Iteration $i ═══"
  result=$(opencode run "$(cat "$SCRIPT_DIR/prompt.md")")

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "PRD complete after $i iterations."
    exit 0
  fi
done