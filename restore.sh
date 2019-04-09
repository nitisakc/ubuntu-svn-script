#!/bin/bash

function usage
{
    echo "usage: ./buildOpenCVTX1.sh [[-s sourcedir ] | [-h]]"
    echo "-s | --sourcedir  Directory in which to place the svn dump sources (default $HOME)"
    echo "-n | --name File name"
    echo "-h | --help  This message"
}

# Iterate through command line inputs
while [ "$1" != "" ]; do
    case $1 in
        -s | --sourcedir )      shift
				                        OPENCV_SOURCE_DIR=$1
                                ;;
        -i | --installdir )     shift
                                INSTALL_DIR=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done
