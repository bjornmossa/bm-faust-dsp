#!/bin/bash

dir=$1
sources="$PWD/$dir"
build_dir="build/$dir"
file_dir=""
file_name=""

mkdir "build"
mkdir $build_dir

cp "./utils.lib" "$build_dir"

for f in $(ls $sources); 
do 
    echo Processing $f ;
    file_name=$(cut -d . -f 1 <<< $f);
    file_dir="$build_dir/$file_name"
    mkdir $file_dir;
    cp "$sources/$f" $file_dir;

    faust2supercollider -d "$file_dir/$f"
done;

echo "$PWD/$dir"
