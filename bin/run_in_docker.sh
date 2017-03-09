#!/bin/bash

set -e -u -o pipefail

zgoubi_results=$1
shift

docker run -u vagrant -v "$zgoubi_results:/zgoubi_results" radiasoft/rszgoubi:latest /rszgoubi-run.sh "$@"
