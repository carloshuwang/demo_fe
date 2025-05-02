FROM alpine as builder
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && apk add --no-cache nodejs npm
COPY . /src/fe-demo
WORKDIR /src/fe-demo
RUN npm config set registry https://registry.npmmirror.com
RUN npm install && npm run build

FROM nginx as prod
COPY --from=builder /src/fe-demo/dist /usr/share/nginx/html
