#!/bin/ash

hyperfine --warmup 100 --runs 500 \
    '/home/langs/lua/echo' \
    '/home/langs/luajit/echo' \
    '/home/langs/rhai/echo' \
    '/home/langs/rune/echo'
