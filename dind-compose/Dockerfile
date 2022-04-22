FROM docker:20.10.14

COPY requirements.txt .

RUN apk add --no-cache py3-pip python3 make bash git curl rust cargo
RUN apk add --no-cache --virtual build-dependencies python3-dev libffi-dev openssl-dev gcc libc-dev make \
    && pip3 install -r requirements.txt \
    && apk del build-dependencies
