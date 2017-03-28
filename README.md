# rszgoubi [![Build Status](https://travis-ci.org/radiasoft/rszgoubi.svg?branch=master)](https://travis-ci.org/radiasoft/rszgoubi)

Python library for working with the [Zgoubi](https://github.com/radiasoft/zgoubi) spin dynamics code. Provides support for testing the quality of the data, building a docker environment that can execute zgoubi and simple parallelizing framework to execute zgoubi in parallel within the docker environment.

## Setup

### Requirements

Your environment should provide:

* Python 2.7
* Docker
* zgoubi, within the `PATH` environment.

### Installation

Checkout the repo and install any aditional requirements:

```sh
git clone https://github.com/radiasoft/rszgoubi
cd rszgoubi
pip install -r requirements.txt
```

## Running zgoubi tests

```sh
cd rszgoubi
python setup.py test
```

## Profiling zgoubi with Valgrind

The following command, will fetch a docker image, and profile zgoubi for `SRDampingInESRFRing-coupled` within docker. A number of profiling sessions equal to the number of processors will be run in parallel. A word of warning, to run until completion it might require more than 10 hours.

```sh
docker pull radiasoft/rszgoubi:latest
cd rszgoubi
./examples/SRDampingInESRFRing/coupled_template/gen_template.sh
mkdir /tmp/profiling_results
./bin/run_in_docker.sh $(realpath ./examples/SRDampingInESRFRing/coupled_template) /tmp/profiling_results valgrind --tool=callgrind --cache-sim=yes --branch-sim=yes zgoubi
```

Learn more at https://github.com/radiasoft/rszgoubi.

Documentation: http://rszgoubi.readthedocs.org/en/latest/

# License

License: http://www.apache.org/licenses/LICENSE-2.0.html

Copyright (c) 2017 RadiaSoft LLC.  All Rights Reserved.
