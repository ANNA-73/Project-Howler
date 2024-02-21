#!/bin/bash

cd /projects/b1042/HartmannLab/Howler
mapfile -t my_list < QCbin.txt
cd /projects/b1042/HartmannLab/Howler/bins
for item in "${my_list[@]}"; do
    cp ${item}.fa  ../QC
    echo "Item: $item"
done
