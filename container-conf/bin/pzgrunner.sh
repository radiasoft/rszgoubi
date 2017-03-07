#!/bin/bash

set -e -u -o pipefail

main() {
    results_root=$1
    shift

    zgoubi_input_root=$1
    shift

    cmd="$@"

    script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    find "$zgoubi_input_root" -name '*.res' \
        | parallel --eta "$script_dir/zgrunner.sh" "$results_root" {} "$cmd"
}

main "$@"
