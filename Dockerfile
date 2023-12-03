FROM alpine
LABEL MAINTAINER="Neil Kuan"
LABEL NAME="awscli"
ENV BUILD_DEPS="python3-dev build-base linux-headers py3-pip"
WORKDIR /app
COPY . .
RUN  apk add --no-cache $BUILD_DEPS python3 \
    && python3 -m ensurepip \
    && pip3 install awscli --no-cache-dir \
    && apk del $BUILD_DEPS

EXPOSE 8080
ENTRYPOINT [ "aws" ]
