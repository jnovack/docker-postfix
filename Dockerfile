FROM alpine:latest

ARG BUILD_RFC3339
ARG COMMIT
ARG VERSION

ENTRYPOINT [ "/entrypoint.sh" ]
STOPSIGNAL SIGKILL

VOLUME /var/spool/mail

EXPOSE 25

LABEL org.opencontainers.image.ref.name="jnovack/postfix" \
      org.opencontainers.image.created=$BUILD_RFC3339 \
      org.opencontainers.image.authors="Justin J. Novack <jnovack@gmail.com>" \
      org.opencontainers.image.documentation="https://github.com/jnovack/docker-postfix/README.md" \
      org.opencontainers.image.description="Simple postfix docker container." \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/jnovack/docker-postfix" \
      org.opencontainers.image.revision=$COMMIT \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.url="https://hub.docker.com/r/jnovack/postfix/"

RUN apk add --no-cache postfix dumb-init

COPY entrypoint.sh /entrypoint.sh
COPY main.cf /etc/postfix/main.cf
