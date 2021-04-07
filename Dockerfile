# Base image https://hub.docker.com/u/rocker/
FROM rocker/tidyverse:4.0.5

LABEL maintainer="Herson Melo <hersonpc@gmail.com>"

# Set working directory ----
WORKDIR /r

# Install java and rJava ----
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

# Install ODBC stuff ----
RUN apt-get -y update && apt-get install -y --install-suggests \
   unixodbc unixodbc-dev \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

## create directories ----
RUN mkdir -p /r

## copy files ----
COPY ./01_install_packages.R /r/install_packages.R

## install R-packages ----
RUN Rscript /r/install_packages.R