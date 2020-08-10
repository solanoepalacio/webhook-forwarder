
FROM golang:alpine AS builder
WORKDIR /go/src/teeproxy
COPY teeproxy.go ./
RUN go build -o teeproxy

FROM alpine:3.5 AS runner

WORKDIR /code

COPY --from=builder /go/src/teeproxy/teeproxy /usr/local/bin

COPY ./start_proxy_server.sh /code
RUN chmod u+x /code/start_proxy_server.sh

CMD ["/bin/sh", "./start_proxy_server.sh"]
