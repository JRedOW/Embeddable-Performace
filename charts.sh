#!/bin/sh

## ECHO
python histogram.py \
    --output /home/output/echo-h.pdf \
    --bins 100 \
    --labels Lua,LuaJIT,Rhai,Rune \
    /home/output/echo.json

python whisker.py \
    --output /home/output/echo-w.pdf \
    --labels Lua,LuaJIT,Rhai,Rune \
    /home/output/echo.json

# Lua
python histogram.py \
    --output /home/output/echo-lua.pdf \
    --bins 100 \
    --labels Lua,LuaJIT,Rhai,Rune \
    --sel-labels Lua,LuaJIT \
    /home/output/echo.json

# Rust
python histogram.py \
    --output /home/output/echo-rust.pdf \
    --bins 100 \
    --labels Lua,LuaJIT,Rhai,Rune \
    --sel-labels Rhai,Rune \
    /home/output/echo.json

## FIB
python histogram.py \
    --output /home/output/fib-h.pdf \
    --bins 100 \
    --labels Lua,LuaJIT,Rhai,Rune \
    /home/output/fib.json

python whisker.py \
    --output /home/output/fib-w.pdf \
    --labels Lua,LuaJIT,Rhai,Rune \
    /home/output/fib.json

# Lua
python histogram.py \
    --output /home/output/fib-lua.pdf \
    --bins 100 \
    --labels Lua,LuaJIT,Rhai,Rune \
    --sel-labels Lua,LuaJIT \
    /home/output/fib.json

# Rust
python histogram.py \
    --output /home/output/fib-rust.pdf \
    --bins 100 \
    --labels Lua,LuaJIT,Rhai,Rune \
    --sel-labels Rhai,Rune \
    /home/output/fib.json
