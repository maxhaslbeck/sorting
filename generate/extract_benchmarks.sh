#!/bin/bash

# make do_benchmark

########################## BEGIN CONFIG SECTION ##################

# Defaults

export NITER=1   # Number of iterations
export NIELEM=$1 # Number of integer elements
#export NIELEM=100000000 # Number of integer elements
export NSELEM=10000000 # Number of string elements

# export NIELEM=10000000 # Number of integer elements
# export NSELEM=1000000 # Number of string elements

export INT_DATA="random random-dup-10 random-boolean organ-pipe sorted equal almost-sorted-.1 almost-sorted-1 almost-sorted-10 almost-sorted-50 sorted-end-.1 sorted-end-1 sorted-end-10 sorted-middle-.1 sorted-middle-1 sorted-middle-10 rev-sorted rev-sorted-end-.1 rev-sorted-end-1 rev-sorted-end-10 rev-sorted-middle-.1 rev-sorted-middle-1 rev-sorted-middle-10"

export STR_DATA="random random-dup-10 random-boolean organ-pipe sorted equal   almost-sorted-.1 almost-sorted-1 almost-sorted-10 almost-sorted-50 sorted-end-.1 sorted-end-1 sorted-end-10 sorted-middle-.1 sorted-middle-1 sorted-middle-10 rev-sorted rev-sorted-end-.1 rev-sorted-end-1 rev-sorted-end-10 rev-sorted-middle-.1 rev-sorted-middle-1 rev-sorted-middle-10"

# CUSTOM Ad-HOC Overrides

# export INT_DATA="random organ-pipe"
# export STR_DATA=""
# export NIELEM=1000 # Number of integer elements
# export NSELEM=1000 # Number of string elements


########################## END CONFIG SECTION ##################

mkdir -p "../benchmarks/$1"

echo "Extracting benchmarks to '../benchmarks/$NIELEM'" 

function run() {
  echo "write to ../benchmarks/$NIELEM/$3"
  ( ./do_benchmark $@ || echo "\n***ERROR $?" ) 2>&1 > "../benchmarks/$NIELEM/$3"
}

function serialize_uint64() {
  run uint64 serialize $1 $NIELEM $NITER
}

function serialize_llstring() {
  run uint64 serialize $1 $NIELEM $NITER
}

for i in $INT_DATA; do
  serialize_uint64 $i
done

#for i in $STR_DATA; do
#  serialize_llstring $i
#done


