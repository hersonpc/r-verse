# Docker Container R

This is a Docker Image for deploy RStudio with some usefull packages installed.

## Docker Hub

https://hub.docker.com/r/hersonpc/r-verse

## Docker commands

To download the image from Docker Hub:  
```shell
docker pull hersonpc/r-verse:latest
```

To build manually a local docker image, without downloading it from Docker Hub, you can use:
```shell
docker build -t hersonpc/r-verse:latest .
```

To excecute the docker container by shell command:
```shell
docker run -d -p 8787:8787 -e PASSWORD=secret hersonpc/r-verse:latest
```

## Docker compose

You can make it avaliable via _docker-compose.yml_ file, than you can call the shell command:  
**docker-compose up -d**  

```yml
version: "3"

services:

  rstudio:
    image: hersonpc/r-verse:latest
    container_name: rstudio
    restart: always
    volumes:
      - ./src:/r
    ports:
      - "8787:8787"
    environment:
      - PASSWORD=secret
      - ROOT=TRUE
```

Then to access the RStudio Server, you can visit http://localhost:8787  
User: **rstudio**  
Pass: **secret**  