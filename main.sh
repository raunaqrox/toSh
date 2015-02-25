#!/bin/bash

# get the todo item
function recordResponse { 
    echo Enter : 
    read todo
    folder=$(pwd)/temp
    file=$(pwd)/temp/todo
    directoryCreate $folder 
    fileCreate $file
    writeToFile $todo
}

# create directory if not exists
function directoryCreate {
    if [ ! -d $1 ]; then
        mkdir $1
    fi
}

# create file if not exists
function fileCreate {
    if [ ! -f $1 ]; then
        touch $1
    fi
}

function writeToFile {
    todo=$1
    file=$(pwd)/temp/todo
    echo $file
    echo $todo >> $file
}

# get the date
function getDate {
    day=$(date +"%d-%m-%Y")
    time=$(dat +"%H-%M-%S")
    return $day $time
}

# check if first and second argument matches 
function checkYN {
    if [[ $1 == $2 ]]; then 
        return 0 
    else
        return 1
    fi
}

function main {
    while [ 0 ];do
        echo "Do you have something todo?(y/n)"
        read yn
        response=${yn:0:1}
        if checkYN $response "y" ; then
            recordResponse
        else 
            echo "do you want to quit?(q)"
            read q
            if checkYN $q "q" ; then
                return 1
            fi
             
            
        fi
    done
}

main
