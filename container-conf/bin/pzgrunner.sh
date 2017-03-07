#!/bin/bash

set -e -u -o pipefail

# ./pzgrunner.sh /path/to/results/root/dir /path/to/inputs/dir zgoubi_command
# Runs zgrunner.sh in parallel. Will use the input dir to search for '*.res' files,
# which will be passed with the other parameters to zgrunner.sh

main() {
    results_root=$1
    shift

    zgoubi_input_root=$1
    shift

    cmd="$@"

    script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    find "$zgoubi_input_root" -name '*.res' \
        | parallel realpath | sort -u \
        | parallel --joblog "$results_root/parallel.log" \
            --eta "$script_dir/zgrunner.sh" "$results_root" {} "$cmd"
}

main "$@"
