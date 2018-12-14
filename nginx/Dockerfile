FROM nginx

MAINTAINER Oleg Makarov <theolegmakarov@gmail.com>

ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
