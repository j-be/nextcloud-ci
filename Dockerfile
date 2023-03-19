FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y \
      git \
      libmagickcore-6.q16-6-extra \
      php \
      php-imagick \
      php-zip \
      php-gd \
      php-curl \
      php-sqlite3 \
      php-intl \
      phpunit

ARG NEXTCLOUD_VERSION=v25.0.0
RUN git clone --depth=1 --branch=$NEXTCLOUD_VERSION https://github.com/nextcloud/server.git
WORKDIR server
RUN git submodule update --init

RUN ./autotest.sh sqlite
