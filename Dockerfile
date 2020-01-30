FROM python:3.7.2-stretch
FROM r-base
MAINTAINER Morgan morgan_howard@brown.edu
WORKDIR /app
ADD . /app
RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip -y \
    && pip3 install -r requirements.txt
CMD [ "uwsgi", "app.ini" ]