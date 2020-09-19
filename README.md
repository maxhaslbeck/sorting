# Sorting algorithms

This repository collects some sorting algorithms.
- introsort, verified in Isabelle by Peter Lammich [https://github.com/lammich/isabelle_llvm]
- std::sort
- boost's pdqsort
- an insertionsort implementation

and generates some benchmark testcases

## Usage:

you will need
- clang >=6.0
- boost in your $HOME/include

then you can make:

```
cd generate
make
```

it will
- extract some benchmark test cases into `benchmarks`
- prepare some algorithms into `algos`

then you can execute an algorithm e.h.
`./algos/oracle benchmarks/10000/random`

and compare two algorithms
`./cmp_algos.sh algos/oracle algos/insertion_sort benchmarks/10000/random`
or
`./cmp_algos.sh algos/oracle algos/flawed_sort benchmarks/10000/random`

  
## Folders
 
from https://github.com/lammich/isabelle_llvm
- `/code` is `/thys/examples/code`
- `/src`
- `/generate` is adapted from `/benchmarks/sorting`
 
new
- algos
- benchmarks
