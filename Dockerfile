# VERSION    1.0
FROM jeanblanchard/busybox-java

MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV ls=logstash-1.4.2

RUN curl -kLsS http://download.elasticsearch.org/logstash/logstash/${ls}.tar.gz | gunzip -c | tar -xf - -C /opt &&\
    ln -s /opt/${ls} /opt/logstash

COPY logstash-syslog.json /etc/logstash/logstash-syslog.json

EXPOSE 5000

ENTRYPOINT ["/opt/logstash/bin/logstash"]
CMD ["-f","/etc/logstash/logstash-syslog.json"]