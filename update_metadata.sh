#!/bin/bash

script_dir=`dirname $0`
cd $script_dir
# go to script dir

FONTDIRS=`find . -maxdepth 1 -type d | sort`

echo "#FIGfonts" > META
echo "processing FIGfonts"

for dir in $FONTDIRS; do
    if [ "$dir" = "./.git" ] || [ "$dir" = "./.github" ] || [ "$dir" = "." ]; then
        echo " * skip directory: $dir"
        continue
    fi

    echo " * enter directory: $dir"
    cd $dir
    FONTS=`find . -maxdepth 1 -type f -name "*.flf" | sed "s!.*/\([^/]*\)\.flf!\1!" | sort`
    count=0
    for f in $FONTS; do
        echo "$f:`echo $dir | sed 's/^\.\///'`/$f" >> ../META
        let count++
    done
    echo "find $count FIGlet fonts in this directory"
    echo " * leave directory: $dir"
    cd ..
done

echo "#control_files" >> META
echo "processing control files"

for dir in $FONTDIRS; do
    if [ "$dir" = "./.git" ] || [ "$dir" = "./.github" ] || [ "$dir" = "." ]; then
        echo " * skip directory: $dir"
        continue
    fi

    echo " * enter directory: $dir"
    cd $dir
    FONTS=`find . -maxdepth 1 -type f -name "*.flc" | sed "s!.*/\([^/]*\)\.flc!\1!" | sort`
    count=0
    for f in $FONTS; do
        echo "$f:`echo $dir | sed 's/^\.\///'`/$f" >> ../META
        let count++
    done
    echo "find $count control files in this directory"
    echo " * leave directory: $dir"
    cd ..
done

echo "#tlf" >> META
echo "processing tlf fonts"

for dir in $FONTDIRS; do
    if [ "$dir" = "./.git" ] || [ "$dir" = "./.github" ] || [ "$dir" = "." ]; then
        echo " * skip directory: $dir"
        continue
    fi

    echo " * enter directory: $dir"
    cd $dir
    FONTS=`find . -maxdepth 1 -type f -name "*.tlf" | sed "s!.*/\([^/]*\)\.tlf!\1!" | sort`
    count=0
    for f in $FONTS; do
        echo "$f:`echo $dir | sed 's/^\.\///'`/$f" >> ../META
        let count++
    done
    echo "find $count TLF fonts in this directory"
    echo " * leave directory: $dir"
    cd ..
done
