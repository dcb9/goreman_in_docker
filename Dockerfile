#FROM alpine
FROM jeanblanchard/alpine-glibc

RUN apk --no-cache add wget unzip supervisor && \
    wget https://github.com/mattn/goreman/releases/download/v0.0.10/goreman_linux_amd64.zip && \
    unzip -o -d /usr/local/bin goreman_linux_amd64.zip && \
    rm goreman_linux_amd64.zip

COPY Procfile /Procfile
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY test_signal_linux_amd64 /usr/local/bin/test_signal

#CMD ["goreman", "-f", "/Procfile", "start"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
