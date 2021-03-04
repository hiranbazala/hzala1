#!/bin/bash
for i in `seq 10`
do
  number=$RANDOM
  echo $i, $number >> inputdata
done
