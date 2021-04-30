FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN set -ex \
        && apk update && apk upgrade \
        && apk add tzdata curl wget git bash perl nodejs npm \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone

RUN mkdir /etc/ct
RUN chgrp -R 0 /etc/ct
RUN chmod -R g+rwX /etc/ct
RUN cd /etc/ct && git clone https://github.com/Davenchy/live-torrent && cd /etc/ct/live-torrent && npm install && npm run build
#RUN cd /etc/ct && git clone https://github.com/Davenchy/live-torrent && cd /etc/ct/live-torrent && sed -i "s/4.13.1/4.14.1/g" /etc/ct/live-torrent/package.json && npm install && npm run build
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV PORT 8080
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
