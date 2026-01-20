docker-ipython-notebook
=======================

Docker container image capable of running an iPython notebook server

This project backs a docker trusted build at https://index.docker.io/u/unfairbanks/docker-ipython-notebook

We use this image with the [dockernotebook](https://github.com/rissem/dockernotebook) project. We intend for it to be able to run _most_ iPython notebooks. Find out more about dockernotebook at http://dockernotebook.com.

Build:

```
sudo docker build -t docker-ipython-notebook:latest .
```

Run:

```
export SH_APIKEY='<yourapikey>'
sudo docker run -d -p 8888:8080 --env SH_APIKEY=$SH_APIKEY docker-ipython-notebook:latest
```
