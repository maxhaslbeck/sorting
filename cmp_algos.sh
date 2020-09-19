#!/bin/bash

mkdir -p /tmp/sorting

$1 $3 > /tmp/sorting/1
$2 $3 > /tmp/sorting/2
if cmp /tmp/sorting/1 /tmp/sorting/2 >/dev/null 2>&1
then echo "SAME"
else echo "DIFF"
fi
