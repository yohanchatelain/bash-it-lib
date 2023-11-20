if [ -z $BIL_DEBUG ]; then
    export BIL_DEBUG=false
fi

export BIL_DEBUG_HELP="
    Usage: bil_debug [message]\n
    Description: Print the message if BIL_DEBUG is true.\n
    Arguments:\n
    \tmessage (string) - The message to print.\n"

function bil_debug() {
    local caller=${FUNCNAME[1]}
    if [ "$BIL_DEBUG" = true ]; then
        printf "\033[1m=== [${caller}]: " >&2
        for arg in "$@"; do
            printf "%q " "$arg" >&2
        done
        printf "\033[0m===\n" >&2
    fi
}

export BIL_COLOR_PRINT_HELP="
    Usage: bil_color_print [color] [bold] [message]\n
    Description: Print the message with the appropriate color.\n
    Arguments:\n
    \tcolor (string) - The color to use.\n
    \tbold (boolean) - If true, the message is printed in bold.\n
    \tmessage (string) - The message to print.\n
"

function bil_color_print() {
    bil_debug $@
    local bold=false
    local color_name="$1"
    shift # Remove the first argument (color name) from the arguments list

    # Check for 'bold' option
    if [ "$1" = "bold" ]; then
        bold=true
        shift # Remove the 'bold' argument
    fi

    # Define color codes
    local RED='31m'
    local GREEN='32m'
    local YELLOW='33m'
    local BLUE='34m'
    local NC='\e[0m' # No Color
    local BOLD='1'

    # Choose the color
    local COLOR=""
    case "$color_name" in
    red) COLOR=$RED ;;
    green) COLOR=$GREEN ;;
    yellow) COLOR=$YELLOW ;;
    blue) COLOR=$BLUE ;;
    *)
        echo "Invalid color"
        return
        ;;
    esac

    # Apply bold if needed
    if [ "$bold" = true ]; then
        COLOR="\e[${BOLD};${COLOR}"
    else
        COLOR="\e[${COLOR}"
    fi

    # Print the message
    echo -en "${COLOR}$@${NC}"
}

export BIL_STATUS_COLORED_HELP="
    Usage: bil_status_colored [status] [message]\n
    Description: Print the message with the appropriate color (green/red) depending on the status.\n
    Arguments:\n
    \tstatus (integer) - The status of the command to check.\n
    \tmessage (string) - The message to print.\n
"

function bil_status_colored() {
    local status=$1
    local message=$2
    # Check the status and print the message with appropriate color
    if [ $status -eq 0 ]; then
        bil_color_print green $message
    else
        bil_color_print red $message
    fi
}

export -f bil_status_colored bil_color_print bil_debug
