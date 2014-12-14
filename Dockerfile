FROM java:openjdk-7u71-jre
MAINTAINER Marc Bachmann <marc.brookman@gmail.com>

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl nano

ENV KIBANA_VERSION 4.0.0-BETA2
RUN curl https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz | tar xz -C /tmp
RUN mv /tmp/kibana-* /app

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD '/start.sh'
EXPOSE 5601
