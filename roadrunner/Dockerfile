ARG PHP_VERSION="8.1"
ARG BASE_IMAGE_REPO="ghcr.io/opentelemetry-php/php"
ARG PHP_EXT_DIR="/usr/local/lib/php/extensions/"
ARG PHP_CONF_DIR="/usr/local/etc/php/conf.d/"
ARG IMAGE_SOURCE=https://github.com/opentelemetry-php/app-base-img

FROM ${BASE_IMAGE_REPO}/ext-ast:${PHP_VERSION} AS ext-ast
FROM ${BASE_IMAGE_REPO}/ext-zip:${PHP_VERSION} AS ext-zip
FROM ${BASE_IMAGE_REPO}/ext-pcntl:${PHP_VERSION} AS ext-pcntl
FROM ${BASE_IMAGE_REPO}/ext-grpc:${PHP_VERSION} AS ext-grpc
FROM ${BASE_IMAGE_REPO}/ext-protobuf:${PHP_VERSION} AS ext-protobuf
FROM ${BASE_IMAGE_REPO}/ext-mbstring:${PHP_VERSION} AS ext-mbstring
FROM ${BASE_IMAGE_REPO}/ext-apcu:${PHP_VERSION} AS ext-apcu
FROM ${BASE_IMAGE_REPO}/ext-opcache:${PHP_VERSION} AS ext-opcache
FROM ${BASE_IMAGE_REPO}/ext-zmq:${PHP_VERSION} AS ext-zmq

FROM ghcr.io/roadrunner-server/roadrunner AS roadrunner

FROM ${BASE_IMAGE_REPO}/cli:${PHP_VERSION}

LABEL org.opencontainers.image.source=${IMAGE_SOURCE}

# AST
COPY --from="ext-ast" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-ast" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# ZIP
COPY --from="ext-zip" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-zip" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# PCNTL
COPY --from="ext-pcntl" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-pcntl" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# GRPC
COPY --from="ext-grpc" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-grpc" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# PROTOBUF
COPY --from="ext-protobuf" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-protobuf" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# MBSTRING
COPY --from="ext-mbstring" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-mbstring" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# APCU
COPY --from="ext-apcu" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-apcu" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# OPCACHE
COPY --from="ext-opcache" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-opcache" ${PHP_CONF_DIR} ${PHP_CONF_DIR}
# ZEROMQ
COPY --from="ext-zmq" ${PHP_EXT_DIR} ${PHP_EXT_DIR}
COPY --from="ext-zmq" ${PHP_CONF_DIR} ${PHP_CONF_DIR}

# ROADRUNNER
COPY --from=roadrunner /usr/bin/rr /usr/local/bin/rr
COPY build/run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/rr && chmod +x /usr/local/bin/run.sh

CMD /usr/local/bin/run.sh

WORKDIR /var/app
