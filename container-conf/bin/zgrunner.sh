#!/bin/bash

set -e -u -o pipefail

# ./zgrunner.sh /path/to/results/root/dir /path/to/input/file.res zgoubi_command
# Given an input file, the runner prepares an output directory, located in the results dir. 
# Then it will execute zgoubi_command to run the simulation.

# Requires GNU Time, to run from non-linux environment pass the path to GNU Time via the env time_cmd

error_msg() {
    echo "ERROR: $1"
    exit 1
}

main() {
    results_root=$1
    shift

    zgoubi_input=$1
    shift

    cmd="$@"

    prepare_results_environment

    run_cmd 
}

prepare_results_environment() {
    test -d "$results_root" || error_msg "$results_root is not a directory"

    test -f "$zgoubi_input" || error_msg "$zgoubi_input could not be found"

    local fp="$(realpath $zgoubi_input)"
    local d="$(dirname $fp)"
    local fn="$(basename $fp)"

    exec_dir="$results_root/$(uuid -v4)"

    test -d "$exec_dir" && error_msg "$exec_dir already exists"


    mkdir "$exec_dir"
    cp -pLR "$d"/* "$exec_dir"
    (
    cd "$exec_dir"
    echo $zgoubi_input > zgoubi_info.txt
    mv "$fn" _zg_tmp
    rm -f *.dat *.res
    mv _zg_tmp zgoubi.dat
    )
}

run_cmd() {
    if [[ -z ${time_cmd+x} ]]; then
        time_cmd=/usr/bin/time
    fi

    (
    cd $exec_dir

    set +e
    eval "$time_cmd -v $cmd" 2> stderr.log 1> stdout.log
    local err=$?
    set -e

    if [[ $err -ne 0 ]]; then
        echo $err > failed.txt 
    fi
    )
}

main "$@"
