FROM alpine:3.5

WORKDIR /code

RUN apk update
RUN apk upgrade
RUN apk add openssh-client

COPY ./start_tunnel.sh /code/start_tunnel.sh
RUN chmod u+x ./start_tunnel.sh

CMD ["/bin/sh", "./start_tunnel.sh"]

