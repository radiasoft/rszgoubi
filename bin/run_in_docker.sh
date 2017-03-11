#!/bin/bash

set -e -u -o pipefail

zgoubi_results=$1
shift

zgoubi_run_cmd="$@"

docker logs -f $(docker run -d --rm -u vagrant -v "$zgoubi_results:/zgoubi_results" \
    radiasoft/rszgoubi:latest /rszgoubi-run.sh "$zgoubi_run_cmd")
