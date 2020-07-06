FROM openjdk:alpine
COPY entry-point.sh /
RUN apk add bash && rm -fr /var/cache/* \
    && wget https://ftp.itu.edu.tr/Mirror/Apache/directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26.tar.gz \
    && mkdir -p /opt/ && tar xf apacheds-2.0.0.AM26.tar.gz -C /opt/ \
    && rm -f apacheds-2.0.0.AM26.tar.gz \
    && ln -s /opt/apacheds-2.0.0.AM26 /opt/apacheds
VOLUME /opt/apacheds/instances
EXPOSE 10389/tcp 10636/tcp 60088/tcp 60464/tcp
ENV INSTANCE default
ENTRYPOINT /entry-point.sh
