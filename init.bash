export BIL_LIB_PATH=$(dirname $(realpath -L "$BASH_SOURCE[0]"))

SOURCES_PATH=$(find ${BIL_LIB_PATH} -type f -name "*.bash" -not -path "${ROOT_PATH}/tests/*" -not -name "init.bash")
for source in $SOURCES_PATH; do
    source ${source}
done
