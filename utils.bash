export BIL_REMOVE_EXTENSION_HELP="
    Usage: bil_remove_extension [filename]\n
    Description: Remove the extension of a filename.\n
    Arguments:\n
    \tfilename (string) - The filename to remove the extension.\n
    Return:\n
    \t(string) - The filename without the extension.\n"
# remove extension file
function bil_remove_extension() {
    local filename="$1"
    local filename_without_ext="${filename%.*}"
    echo "$filename_without_ext"
}

export BIL_SOURCE_RELATIVE_HELP="
    Usage: bil_source_relative [filename]\n
    Description: Source a file relative to the current script.\n
    Arguments:\n
    \tfilename (string) - The filename to source.\n
    Return:\n
    \t0 - If the file was sourced.\n
    \t1 - If the file was not sourced.\n"

function bil_source_relative() {
    # Get the full path of the current script
    local script_dir=$(cd $(dirname "$0") && pwd)

    # Construct the path to the file to be sourced
    # Assuming the file to be sourced is in the root directory of the project
    local file_to_source="$script_dir/${1}"

    # Check if the file exists
    if [ -f "$file_to_source" ]; then
        # Source the file
        source "$file_to_source"
        return 0
    else
        echo "File to source not found: $file_to_source"
        return 1
    fi
}

export BIL_GET_ROOT_PATH_HELP="
    Usage: bil_get_root_path\n
    Description: Get the root path of the project.\n
    Return:\n
    \t(string) - The root path of the project.\n"

function bil_get_root_path() {
    echo $BIL_LIB_PATH
}

export BIL_EXECUTE_HELP="
    Usage: bil_execute [--dry-run] [--debug] [command]\n
    Description: Execute or print a command based on DRY_RUN.\n
    Arguments:\n
    \t--dry-run (flag) - Print the command instead of executing it.\n
    \t--debug (flag) - Print the command and execute it.\n
    \tcommand (string) - The command to execute.\n"

# Function to execute or print a command based on DRY_RUN
function bil_execute() {
    bil_debug $@
    local arg=$1
    if [ "$arg" = "--dry-run" ]; then
        shift
        echo "Dry-run: $@"
    elif [ "$arg" == '--debug' ]; then
        shift
        echo "Debug: $@"
        eval $@
    else
        eval $@
    fi
}

export -f bil_get_root_path bil_source_relative bil_execute
