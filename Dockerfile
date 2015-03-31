FROM debian:wheezy
MAINTAINER Marc Bachmann <marc.brookman@gmail.com>

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl

ENV KIBANA_VERSION 4.0.1-linux-x64
RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz | tar xz -C /tmp
RUN mv /tmp/kibana-* /app

WORKDIR /app
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD '/start.sh'
EXPOSE 5601
