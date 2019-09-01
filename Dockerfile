FROM ubuntu:18.04

MAINTAINER dalei guoyunlei@luojilab.com

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install nginx &&\
    apt-get -y install nodejs &&\
    apt-get -y install npm &&\
    npm install -g cors-anywhere

WORKDIR /data/web/openapi

COPY . .

COPY openapi.conf /etc/nginx/conf.d/default.conf
COPY cors_server.js /usr/local/lib/node_modules/cors-anywhere/

RUN chmod +x run.sh

EXPOSE 80

CMD [ "/data/web/openapi/run.sh" ]
