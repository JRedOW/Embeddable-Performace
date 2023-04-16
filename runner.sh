#!/bin/ash

hyperfine --warmup 100 --runs 500 \
    '/home/langs/lua/echo' \
    '/home/langs/luajit/echo' \
    '/home/langs/rhai/echo' \
    '/home/langs/rune/echo' \
    --export-markdown output/echo.md \
    --export-json output/echo.json

hyperfine --warmup 10 --runs 50 \
    '/home/langs/lua/fib' \
    '/home/langs/luajit/fib' \
    '/home/langs/rhai/fib' \
    '/home/langs/rune/fib' \
    --export-markdown output/fib.md \
    --export-json output/fib.json

hyperfine --warmup 100 --runs 500 \
    '/home/langs/lua/math' \
    '/home/langs/luajit/math' \
    '/home/langs/rhai/math' \
    '/home/langs/rune/math' \
    --export-markdown output/math.md \
    --export-json output/math.json

awk -F '|' '{ print "|", $2, "|", $3, "|" }' output/echo.md > output/echo-min.md
awk -F '|' '{ print "|", $2, "|", $3, "|" }' output/fib.md > output/fib-min.md
awk -F '|' '{ print "|", $2, "|", $3, "|" }' output/math.md > output/math-min.md
