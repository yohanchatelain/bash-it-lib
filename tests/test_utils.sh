SOURCES_PATH=$(find ${ROOT_PATH} -type f -name "*.bash" -not -path "${ROOT_PATH}/tests/*" -not -name "init.bash")

function _bil_source_relative_test() {
    bil_color_print blue bold "\nRun test for bil_source_relative\n"
    for source in $SOURCES_PATH; do
        source_relative=$(basename $source)
        bil_expect_fail bil_source_relative "${source_relative}"
        bil_expect_pass bil_source_relative "../${source_relative}"
    done
}

function _bil_get_root_path_test() {
    bil_color_print blue "\nRun test for bil_get_root_path\n"
    bil_expect_pass $(echo bil_get_root_path) == $ROOT_PATH
    local current_path=$(pwd)
    cd /tmp/
    bil_expect_pass $(echo bil_get_root_path) == $ROOT_PATH
    cd $current_path

}

function _bil_execute_test() {
    bil_color_print blue "\nRun test for bil_execute\n"
    bil_expect_pass bil_execute --dry-run echo "Test"
    bil_expect_pass bil_execute --debug echo "Test"
    bil_expect_pass bil_execute echo "Execute"
}

echo "Run tests for utils.bash"
_bil_source_relative_test
_bil_get_root_path_test
_bil_execute_test
