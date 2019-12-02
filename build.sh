#!/bin/zsh/

cargo run

clang -emit-llvm -S -O -o builtin.ll builtin.c
llvm-link main.ll builtin.ll -S -o linked.ll

clang linked.ll -o main
