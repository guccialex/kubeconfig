#!/bin/bash


mainfile="singlegame.yaml"


for filenumb in 1 2 3 4 5 6 7
do

    # the filename
    filename="singlegame${filenumb}.yaml"

    echo $filename

    #copy the file with the new filename
    cp $mainfile $filename


    search="{VAR}"

    replace=$filenumb


    #replace instances of {VAR} with  filenumb
    if [[ $search != "" && $replace != "" ]]; then
    sed -i "s/$search/$replace/" $filename
    fi


    #apply that file with kubectl
    kubectl apply -f $filename


done

