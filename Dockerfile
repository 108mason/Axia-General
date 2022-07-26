#FROM httpd:alpine
#COPY ./src/ /usr/local/apache2/htdocs/


FROM node:alpine as builder
RUN apk update && apk add --no-cache make git
WORKDIR /app
COPY .  /app
RUN ls


FROM ubuntu:18.04
RUN apt update
RUN apt install apache2 -y
RUN a2enmod rewrite

RUN rm -rf /var/www/html/*
RUN mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.orig
COPY devops/apache.conf /etc/apache2/apache2.conf
COPY devops/.htaccess /var/www/html/
COPY --from=builder ./app/src/ /var/www/html/
CMD /usr/sbin/apache2ctl -D FOREGROUND
