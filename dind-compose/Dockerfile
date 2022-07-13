FROM docker:20.10.17 as builder

WORKDIR /build

RUN apk add git make go
RUN git clone https://github.com/docker/compose -b v2.6.1 \
    && cd compose \
    && make -f builder.Makefile compose-plugin


FROM docker:20.10.17

RUN apk add --no-cache py3-pip python3 make bash git curl

COPY --from=builder /build/compose/bin/docker-compose /bin/
