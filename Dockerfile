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

FROM alpine:3.17

RUN apk add --no-cache hyperfine libstdc++

WORKDIR /home

ADD ./runner.sh /home/runner.sh

COPY --from=lua /home/bin /home/langs/lua 

CMD ["/home/runner.sh"]
