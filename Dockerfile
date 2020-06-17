FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade

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



ADD configure.sh /configure.sh
RUN chmod +x /configure.sh

ENTRYPOINT ["sh", "/configure.sh"]

EXPOSE 3000
