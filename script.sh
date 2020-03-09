#!/bin/bash

if [ $# -eq 2 ]; then
    export SRCARCH="$2"
    kconfig_dir="$PWD"
    cd "$1"
    "$kconfig_dir/binary/dumpconf" Kconfig > "$kconfig_dir/out.rsf"
    cd "$kconfig_dir"
    mv src/main/scala/KConfigReader.scala src/main/scala/KConfigReader.scala+old 2> /dev/null
    mv src/main/scala/.KConfigReader.scala src/main/scala/KConfigReader.scala 2> /dev/null
else
    echo "Please specify the path to linux kernel dir and architecture"
    echo "Like so :"
    echo "script.sh <path> <arch>"
fi
