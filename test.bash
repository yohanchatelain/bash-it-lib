if [ -z $BIL_VERBOSE_TEST ]; then
    export BIL_VERBOSE_TEST=0
fi

export BIL_TEST_HELP="Usage: bil_test [expected_status] [command]\n
Description: Execute the command and check the status.\n
Arguments:\n
\texpected_status (integer) - The expected status of the command.\n
\tcommand (string) - The command to execute.\n"

function bil_test() {
    local test_expect=$1
    shift 1
    rm -rf test.log
    eval $@ &>test.log
    local status=$?
    if [ $status -eq $test_expect ]; then
        bil_status_colored 0 $BIL_SUCCESS_SYMBOL
    else
        bil_status_colored 1 $BIL_FAILURE_SYMBOL
    fi
}

function _bil_cat_test_log() {
    local color=$1
    if [[ "$BIL_VERBOSE_TEST" =~ ^[0-9]+$ ]] && ((BIL_VERBOSE_TEST > 0)) && [ -s test.log ]; then
        bil_color_print ${color} "Expected success:\n$(cat test.log)\n"
    fi
}

export BIL_EXPECT_PASS_HELP="Usage: bil_expect_pass [command]\n
Description: Execute the command and check the status.\n
Arguments:\n
\tcommand (string) - The command to execute.\n"

function bil_expect_pass() {
    local test=$(bil_test 0 "$@")
    echo -e "[${test}] $@"
    _bil_cat_test_log green
}

export BIL_EXPECT_FAIL_HELP="Usage: bil_expect_fail [command]\n
Description: Execute the command and check the status.\n
Arguments:\n
\tcommand (string) - The command to execute.\n"

function bil_expect_fail() {
    local test=$(bil_test 1 "$@")
    echo -e "[${test}] $@"
    _bil_cat_test_log yellow
}

export -f bil_expect_pass bil_expect_fail
