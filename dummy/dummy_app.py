#!/usr/bin/env python
#coding: UTF-8

import logging
import sys
import signal
import time

def cb_sigint(sig, *a):
    global stop
    logging.info('Got signal %s', sig)

def main():
    signal.signal(signal.SIGINT, cb_sigint)
    signal.signal(signal.SIGTERM, cb_sigint)
    while True:
        logging.info('hello')
        time.sleep(10)

def setup_logging(level=logging.INFO):
    kw = {
        'format': '[%(asctime)s][%(module)s]: %(message)s',
        'datefmt': '%m/%d/%Y %H:%M:%S',
        'level': level,
        'stream': sys.stdout
    }

    logging.basicConfig(**kw)

if __name__ == '__main__':
    setup_logging()
    main()
