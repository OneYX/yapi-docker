FROM node:8-alpine
LABEL maintainer="pingdongyi@gmail.com"

RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main/' > /etc/apk/repositories \
    && echo 'http://mirrors.aliyun.com/alpine/latest-stable/community/' >> /etc/apk/repositories \
    && apk update

WORKDIR /api

COPY config.json ./

RUN apk add make git python \
	&& git clone https://github.com/YMFE/yapi.git vendors \
	&& cd vendors \
	&& npm install --production --registry https://registry.npm.taobao.org

VOLUME ["/api"]

EXPOSE 3000

ENTRYPOINT [ "node" ]
