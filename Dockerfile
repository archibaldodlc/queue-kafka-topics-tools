FROM alpine:3.5

MAINTAINER RunAbove <contact@runabove.com>

RUN apk --update add ca-certificates wget bash openjdk8-jre python2 py2-pip && \
	rm -rf /var/cache/apk && \
	wget -q https://www.apache.org/dyn/closer.cgi?path=/kafka/3.1.0/kafka_2.13-3.1.0.tgz -O /tmp/kafka.tgz && \
	mkdir -p /opt && tar -xzf /tmp/kafka.tgz -C /opt && \
	mv /opt/kafka_2.13-3.1.0 /opt/kafka && \
	rm /tmp/kafka.tgz && \
	pip install --upgrade pip kafka-tools

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH /opt/kafka/bin:$PATH
