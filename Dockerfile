
FROM golang:alpine AS builder
WORKDIR /go/src/teeproxy
COPY teeproxy.go ./
RUN go build -o teeproxy

FROM alpine:3.5 AS runner
COPY --from=builder /go/src/teeproxy/teeproxy /usr/local/bin

CMD ["teeproxy", "-l=:5000", \
    "-a", "172.17.0.1:8000", \
    "-b", "172.17.0.1:8001", \
    "-b", "172.17.0.1:8002", \
    "-b", "172.17.0.1:8003", \
    "-b", "172.17.0.1:8004", \
    "-debug", "true"]