#!/usr/bin/env bash

set -eu -o pipefail

[[ $BASH_VERSION > 4 ]] || exit 1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

for NUM_PARTICLES in {100..1100..500}; do
    for NUM_RUNS in {1..11..5}; do
        NUM_RUNS=${NUM_RUNS} NUM_PARTICLES=${NUM_PARTICLES} \
            envsubst < coupling0.58.template > coupling.${NUM_PARTICLES}.${NUM_RUNS}.dat
    done
done
