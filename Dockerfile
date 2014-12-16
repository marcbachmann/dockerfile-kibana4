FROM java:openjdk-7u71-jre
MAINTAINER Marc Bachmann <marc.brookman@gmail.com>

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl

ENV KIBANA_VERSION 4.0.0-beta3
RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz | tar xz -C /tmp
RUN mv /tmp/kibana-* /app

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD '/start.sh'
EXPOSE 5601
