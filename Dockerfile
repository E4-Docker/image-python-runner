FROM alpine:latest

LABEL maintainer="eu4ng97@gmail.com"
LABEL version="0.1.0"
LABEL description=""

RUN apk update

WORKDIR /usr/src/app

COPY init.sh init.sh
RUN chmod 755 init.sh

ENTRYPOINT [ "./init.sh" ]
