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

#write the todo to file /temp/todo
function writeToFile {
    #get time
    local dt=$(getDate)
    todo=$1 
    file=$(pwd)/temp/todo
    echo $todo :: $dt >> $file
}

# get the date
function getDate {
    day=$(date +"%d-%m-%Y")
    time=$(date +"%H-%M-%S")
    #echo works kind of like return here
    echo $day $time
}

# check if first and second argument matches 
function checkYN {
    if [[ $1 == $2 ]]; then 
        return 0 
    else
        return 1
    fi
}

function showFilesTemp {
    echo ls ./temp
    return 1
}

function main {
    while [ 0 ];do
        echo "Do you have something todo?(y/n)"
        read yn
        #now make a function to show all the possible
        #lists in temp with numbering and let user select
        #showFilesTemp
        #take the first character
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
