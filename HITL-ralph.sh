#!/bin/bash

# Get the absolute path to the directory containing this script.
# ${BASH_SOURCE[0]} is the path to this script, dirname extracts the directory,
# and cd + pwd resolves it to an absolute path.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utilities/load-environment-variables.sh"
load_environment_variables

# Run opencode with the contents of prompt.md (located alongside this script).
opencode run "$(cat "$SCRIPT_DIR/prompt.md")"