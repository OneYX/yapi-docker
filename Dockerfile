FROM node:8-alpine
LABEL maintainer="pingdongyi@gmail.com"

RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main/' > /etc/apk/repositories \
    && echo 'http://mirrors.aliyun.com/alpine/latest-stable/community/' >> /etc/apk/repositories \
    && apk update

RUN apk add git python \
	&& mkdir api \
	&& cd api \
	&& git clone https://github.com/OneYX/yapi.git vendors \
	&& cp vendors/config.json ./config.json \
	&& cd vendors \
	&& npm install --production --registry https://registry.npm.taobao.org

WORKDIR /api/vendors
VOLUME ["/api"]

EXPOSE 3000