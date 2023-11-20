function _bil_is_integer_test() {
    echo "Run test for bil_is_integer"
    bil_expect_pass bil_is_integer 1
    bil_expect_fail bil_is_integer 1.1
    bil_expect_pass bil_is_integer -1
    bil_expect_fail bil_is_integer -1.1
    bil_expect_fail bil_is_integer a
    bil_expect_fail bil_is_integer
}

function _bil_is_float_test() {
    echo "Run test for bil_is_float"
    bil_expect_pass bil_is_float 1
    bil_expect_pass bil_is_float 1.1
    bil_expect_pass bil_is_float -1
    bil_expect_pass bil_is_float -1.1
    bil_expect_fail bil_is_float a
    bil_expect_fail bil_is_float
}

echo "Run tests for type.bash"
_bil_is_integer_test
_bil_is_float_test
