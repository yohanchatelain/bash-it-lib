functions_list=(bil_is_integer bil_is_float bil_expect_pass bil_expect_fail bil_status_colored bil_color_print bil_debug bil_remove_extension bil_get_root_path bil_source_relative bil_execute bil_display_help)

export BIL_DISPLAY_HELP_HELP="Usage: bil_display_help [--list-function] [function_name]\n"

function bil_display_help() {
    local function_name="$1"

    case "$function_name" in
    --list-function)
        echo "BIL functions list:"
        for function in ${functions_list[@]}; do
            echo -e "  - $function"
        done
        ;;
    bil_is_integer)
        echo $BIL_IS_INTEGER_HELP
        ;;
    bil_is_float)
        echo $BIL_IS_FLOAT_HELP
        ;;
    bil_expect_pass)
        echo $BIL_EXPECT_PASS_HELP
        ;;
    bil_expect_fail)
        echo $BIL_EXPECT_FAIL_HELP
        ;;
    bil_debug)
        echo $BIL_DEBUG_HELP
        ;;
    bil_color_print)
        echo -e $BIL_COLOR_PRINT_HELP
        ;;
    bil_status_colored)
        echo -e $BIL_STATUS_COLORED_HELP
        ;;
    bil_remove_extension)
        echo -e $BIL_REMOVE_EXTENSION_HELP
        ;;
    bil_get_root_path)
        echo -e $BIL_GET_ROOT_PATH_HELP
        ;;
    bil_source_relative)
        echo -e $BIL_SOURCE_RELATIVE_HELP
        ;;
    bil_execute)
        echo -e $BIL_EXECUTE_HELP
        ;;
    *)
        echo -e $BIL_DISPLAY_HELP_HELP
        ;;
    esac
}
