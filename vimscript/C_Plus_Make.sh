#!/usr/bin/bash

cmake_file="CMakeLists.txt"

function change_dir() {
    current_location=$(pwd)
    # dir="$current_location/build"
    # echo $current_location
    if [ -d "$current_location" ]
    then
        # cd $HOME/tmp/c++/c++_Dictionary/build/
        eval "cd $current_location"/build/
    else
        echo "Directory doesn't exist"
    fi
}

function getProgramName() {
if [ -f "$cmake_file" ]
then
    program_name=$(grep 'add_executable' "$cmake_file" |\
    awk '{print $1}' |\
    sed 's/add_executable(//')
echo "${program_name}"
else
    return 1
fi
}

function getRootDir() {
if [ -f "$cmake_file" ]
then
project_name=$(grep -m1 'project' "$cmake_file" |\
    awk '{print $1}' |\
    sed 's/project(//' |\
    sed 's/)//')
echo "${project_name}"
else
    return 1
fi
}

function getDir() {
    echo $(pwd | awk -F "/" '{print $NF}')
}

# c_plus_plus_dir="$HOME/tmp/c++/"

root_dir="$(getRootDir)"
# echo "$root_dir"
res="$(getProgramName)"
# change_dir

cur_dir="$(getDir)"
# echo "$cur_dir"
case "$cur_dir" in
    "Main")
        echo "your in the Main directory"
        cd ../build
        make
        cd build/Main
        ;;
    "src")
        echo "your in the src directory"
        cd ../build
        make
        ;;
    "include")
        echo "include directory"
        cd ../build
        make
        ;;
    "data")
        echo "data directory"
        cd ../build
        make
        ;;
    "build")
        echo "build directory"
        make
        ;;
    "$root_dir")
        echo "your in root dir"
        cd build
        make
        ;;
esac



