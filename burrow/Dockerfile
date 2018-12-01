FROM golang:1.11.2 as builder
RUN curl -sSL https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN mkdir -p /go/src/github.com/linkedin && \
    cd /go/src/github.com/linkedin && \
    git clone --depth=1 https://github.com/linkedin/Burrow.git
WORKDIR /go/src/github.com/linkedin/Burrow

RUN dep ensure && \
    go build

FROM alpine:3.8
ENTRYPOINT ["/entry.sh"]
ARG LIBC_VERSION=2.28-r0

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q -O /tmp/glibc-${LIBC_VERSION}.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${LIBC_VERSION}/glibc-${LIBC_VERSION}.apk && \
    apk add /tmp/glibc-${LIBC_VERSION}.apk && \
    rm -f /tmp/glibc-${LIBC_VERSION}.apk

COPY entry.sh /entry.sh
# TO invalidate the cache for the COPY statement below
ENV BUILDDATE=20181201
COPY --from=builder /go/src/github.com/linkedin/Burrow/Burrow /usr/bin/Burrow
