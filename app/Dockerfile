FROM python:alpine

MAINTAINER Oleg Makarov <theolegmakarov@gmail.com>

RUN apk add --update tzdata
RUN rm -rf /var/cache/apk/*

RUN pip install flask
ADD date.py /opt/date.py

ENTRYPOINT ["python", "/opt/date.py"]

EXPOSE 3000
