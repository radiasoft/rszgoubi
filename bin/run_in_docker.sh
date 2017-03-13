#!/bin/bash

set -e -u -o pipefail

zgoubi_examples=$1
shift

zgoubi_results=$1
shift

zgoubi_run_cmd="$@"

docker logs -f $(docker run -d --rm -u vagrant \
    -v "$zgoubi_results:/zgoubi_results" \
    -v "$zgoubi_examples:/zgoubi_examples" \
    radiasoft/rszgoubi:latest /rszgoubi-run.sh "$zgoubi_run_cmd")
