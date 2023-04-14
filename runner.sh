#!/bin/ash

hyperfine --warmup 100 --runs 500 \
    '/home/langs/lua/echo' \
    '/home/langs/luajit/echo' \
    '/home/langs/rhai/echo' \
    '/home/langs/rune/echo'

hyperfine --warmup 10 --runs 50 \
    '/home/langs/lua/fib' \
    '/home/langs/luajit/fib' \
    '/home/langs/rhai/fib' \
    '/home/langs/rune/fib'
