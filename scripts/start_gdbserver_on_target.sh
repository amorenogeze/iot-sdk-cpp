#!/bin/bash

cd ..
cd targets

for FILE in *
    do 
    echo $FILE
    ssh  root@$FILE 'ls' exit
    echo $?
done

