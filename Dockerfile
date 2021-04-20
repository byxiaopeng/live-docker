FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade
ENV PORT 8080
RUN apt install wget -y
RUN apt install curl -y
RUN apt install git -y
RUN apt install unzip -y
RUN apt install git -y
RUN apt install bash -y
RUN apt install sudo -y
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /etc/ct
RUN chgrp -R 0 /etc/ct
RUN chmod -R g+rwX /etc/ct

RUN cd /etc/ct && git clone https://github.com/Davenchy/live-torrent && cd /etc/ct/live-torrent && sed -i "s/4.13.1/4.14.1/g" /etc/ct/live-torrent/package.json && npm install && npm run build
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
