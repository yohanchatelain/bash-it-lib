# Check argument is integer

export BIL_IS_INTEGER_HELP="
    Usage: bil_is_integer [number]\n
    Description: Check if the argument is an integer.\n
    Arguments:\n
    \tnumber (integer) - The number to check.\n
    Return:\n
    \t0 - If the argument is an integer.\n
    \t1 - If the argument is not an integer.\n"

function bil_is_integer() {
    local re='^-?[0-9]+$' # Regular expression for an integer
    if [[ $1 =~ $re ]]; then
        true
    else
        false
    fi
}

export BIL_IS_FLOAT_HELP="
    Usage: bil_is_float [number]\n
    Description: Check if the argument is a float.\n
    Arguments:\n
    \tnumber (float) - The number to check.\n
    Return:\n
    \t0 - If the argument is a float.\n
    \t1 - If the argument is not a float.\n"

function bil_is_float() {
    local re='^-?[0-9]+([.][0-9]+)?$' # Regular expression for a float
    if [[ $1 =~ $re ]]; then
        true
    else
        false
    fi
}

export -f bil_is_integer bil_is_float
