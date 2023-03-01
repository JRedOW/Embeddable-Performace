###     LUA     ###
FROM alpine:3.17 as lua

ARG LUA_VER="5.4.4"

RUN apk add --no-cache libc-dev readline readline-dev gcc g++ make wget

RUN cd /tmp \
    && wget https://www.lua.org/ftp/lua-${LUA_VER}.tar.gz \
    && tar zxf lua-${LUA_VER}.tar.gz \
    && cd lua-${LUA_VER} \
    && make linux install \
    && cd /tmp \
    && rm -rf /tmp/*

WORKDIR /home

RUN mkdir bin

ADD ./langs/lua/ /home/

RUN g++ -o bin/echo echo.cpp -Llib -llua


###     LUAJIT     ###
FROM alpine:3.17 as luajit

ARG LUAJIT_VER="2.0.5"

RUN apk add --no-cache libc-dev readline readline-dev gcc g++ make wget

RUN cd /tmp \
    && wget https://luajit.org/download/LuaJIT-${LUAJIT_VER}.tar.gz \
    && tar zxf LuaJIT-${LUAJIT_VER}.tar.gz \
    && cd LuaJIT-${LUAJIT_VER} \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/*

RUN cp -R /usr/local/include/luajit-2.0/* /usr/local/include

WORKDIR /home

RUN mkdir bin

ADD ./langs/luajit/ /home/

RUN g++ -o bin/echo echo.cpp -Llib -lluajit-5.1


###     Runner     ###
FROM alpine:3.17

RUN apk add --no-cache hyperfine libstdc++

WORKDIR /home

ADD ./runner.sh /home/runner.sh

##   LUA   ##
COPY --from=lua /home/bin /home/langs/lua 

##   LUAJIT   ##
COPY --from=luajit /home/bin /home/langs/luajit 
COPY --from=luajit /usr/local/lib/libluajit-5.1.so.2 /usr/local/lib/libluajit-5.1.so.2

CMD ["/home/runner.sh"]
