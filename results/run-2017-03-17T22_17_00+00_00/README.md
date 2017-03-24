# zgoubi profiling results for `SRDampingInESRFRing-coupled`

## Introduction

In order to improve the execution time zgoubi we profile the `SRDampingInESRFRing-coupled` with a variety of parameters. The goal is to identify major bottlenecks in the application and to ensure that the bottlenecks remain with different computational loads.

## Methods

### Input Data

Based of the `SRDampingInESRFRing-coupled` we [generated](../../examples/SRDampingInESRFRing/coupled_template), 9 input files (`zgoubi.dat`) where we varied the number of turns (1, 6, 11) and particles (100, 600, 1100).

### Execution Profiling

To gather information about the execution we used [Valgrind](http://www.valgrind.org), enabling cache and branch analysis. The commandline to invoke Valgrind with these setting is:

```sh
valgrind --tool=callgrind --cache-sim=yes --branch-sim=yes zgoubi
```

Since Valgrind is a virtual execution environment, it does not achieve full native execution speed of the application; we have observed slowdowns of more than 70x the native execution, so in order to make the profiling feasible it is only possible to execute examples with restricted run times.

### Execution environment

All the necessary code has been packed in Docker based [environment](../../container-conf). In order to run the experiment we executed the following:

```sh
docker pull radiasoft/rszgoubi
./examples/SRDampingInESRFRing/coupled_template/gen_template.sh
./bin/run_in_docker.sh $(realpath ./examples/SRDampingInESRFRing/coupled_template) /tmp/run-2017-03-17T22_17_00+00_00 valgrind --tool=callgrind --cache-sim=yes --branch-sim=yes zgoubi

```

### Analysis of Results

Valgrind results were analyzed using [`KCachegrind`](https://kcachegrind.github.io/html/Home.html). `KCachegrind`, provides visualization of execution stacks and costs related to execution, branching mis-prediction and cache access misses. 

## Results

## Discussion

A runtime execution profile 