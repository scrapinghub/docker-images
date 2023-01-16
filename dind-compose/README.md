Build images
============

We are using docker-compose images to run builds on k8s.


Build image
-----------

```
$ docker build -f Dockerfile . -t images.scrapinghub.com/infra/dind-compose:20.10.17
$ docker build -f Dockerfile.erlang . -t images.scrapinghub.com/infra/dind-compose-erlang:20.10.22
```
