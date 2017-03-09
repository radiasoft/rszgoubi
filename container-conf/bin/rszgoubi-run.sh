#!/bin/bash -l

set -e -u -o pipefail

exec pzgrunner.sh /zgoubi_results $HOME/src/zgoubi/exemples "$@"
