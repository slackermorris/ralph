function load_environment_variables() {
    # Find the project root by asking git for the top-level directory.
    # This works regardless of how deep the script is nested in the project.
    # stderr is redirected to /dev/null to suppress errors if not in a git repo.
    PROJECT_ROOT="$(cd "$SCRIPT_DIR" && git rev-parse --show-toplevel 2>/dev/null)"

    # Exit with error if we're not inside a git repository.
    if [ -z "$PROJECT_ROOT" ]; then
    echo "Error: Not inside a git repository" >&2
    exit 1
    fi

    # Exit with error if no .env file exists at the project root.
    if [ ! -f "$PROJECT_ROOT/.env" ]; then
    echo "Error: No .env file found at project root ($PROJECT_ROOT)" >&2
    exit 1
    fi

    # Load environment variables from .env file.
    # set -a causes all variables to be automatically exported.
    # source reads and executes the file in the current shell.
    # set +a disables auto-export for subsequent variables.
    set -a
    source "$PROJECT_ROOT/.env"
    set +a
    # Find the project root by asking git for the top-level directory.
    # This works regardless of how deep the script is nested in the project.
    # stderr is redirected to /dev/null to suppress errors if not in a git repo.
    PROJECT_ROOT="$(cd "$SCRIPT_DIR" && git rev-parse --show-toplevel 2>/dev/null)"

    # Exit with error if we're not inside a git repository.
    if [ -z "$PROJECT_ROOT" ]; then
    echo "Error: Not inside a git repository" >&2
    exit 1
    fi

    # Exit with error if no .env file exists at the project root.
    if [ ! -f "$PROJECT_ROOT/.env" ]; then
    echo "Error: No .env file found at project root ($PROJECT_ROOT)" >&2
    exit 1
    fi

    # Load environment variables from .env file.
    # set -a causes all variables to be automatically exported.
    # source reads and executes the file in the current shell.
    # set +a disables auto-export for subsequent variables.
    set -a
    source "$PROJECT_ROOT/.env"
    set +a
}
