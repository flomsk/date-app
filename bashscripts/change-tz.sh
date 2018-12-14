#!/bin/bash
sed -i '6i\RUN cp /usr/share/zoneinfo/'$1' /etc/localtime\' app/Dockerfile
