# What is this?

[Burrow](https://github.com/linkedin/Burrow) is a service that provides the metrics for kafka consumer lags. This directory provides a Dockerfile to build the docker image for Burrow.

The image would be built automatically on [docker hub](https://hub.docker.com/r/scrapinghub/burrow/) each time this repo is updated.

To test the build locally:

```sh
docker build -t scrapinghub/burrow .
```
