#!/bin/bash

# redirect output of the commands to stdout of this script file
exec > >(tee -i setup_llvm.log)


# # if llvm exists then remove it
# if [ -d "llvm" ]; then
#     echo "Removing llvm directory..."
#     rm -rf llvm
#     rm -rf lib
#     rm -rf bin
# fi

# # Install LLVM 3.5.0

# echo "Downloading LLVM 3.5.0..."
# wget http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz
# tar -xvf llvm-3.5.0.src.tar.xz
# mv llvm-3.5.0.src llvm


# cd llvm || exit
# # Install Clang 3.5.0
# echo "Building LLVM 3.5.0..."
# ./configure CC=clang CXX=clang++ --disable-optimized --with-python=/usr/bin/python2
# make -j 128
# cd .. || exit

LLVM_DIR=/home/ding/Documents/courses/cs502/pa0/llvm

# check if the symbolic link lib exists

if [ ! -L "lib" ]; then
    echo "Creating lib directory..."
    ln -s $LLVM_DIR/Debug+Asserts/lib/ lib
fi

if [ ! -L "bin" ]; then
    echo "Creating bin directory..."
    ln -s $LLVM_DIR/Debug+Asserts/bin/ bin
fi


if [ ! -d "llvm" ]; then
    echo "copying llvm directory..."
    cp -r $LLVM_DIR llvm
    exit
fi


echo "Done setting up llvm."