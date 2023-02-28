FROM alpine:3.17

RUN apk add --no-cache hyperfine

ADD ./runner.sh /home/runner.sh

CMD ["/home/runner.sh"]
