FROM golang:1.10.3 as builder
RUN curl -sSL https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN go get github.com/scrapinghub/Burrow
WORKDIR /go/src/github.com/scrapinghub/Burrow

RUN git fetch origin \
    && git checkout fix-pid-check
RUN dep ensure \
    && go install

FROM alpine:3.7
CMD ["/usr/bin/Burrow", "-config-dir", "/etc/burrow"]

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk && \
    apk add glibc-2.27-r0.apk

COPY --from=builder /go/bin/Burrow /usr/bin/Burrow
