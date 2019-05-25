FROM ubuntu:18.04

RUN apt-get update && apt-get install -yqq curl gcc libc6-dev zlib1g-dev maven

ENV JDK_VERSION openjdk-8u212-jvmci-20-b01
ENV JDK_URL https://github.com/graalvm/openjdk8-jvmci-builder/releases/download/jvmci-20-b01/${JDK_VERSION}-linux-amd64.tar.gz

RUN curl -4 -L $JDK_URL -o /tmp/graal
RUN tar -zxvf /tmp/graal

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV JDK openjdk1.8.0_212-jvmci-20-b01
ENV JAVA_HOME /${JDK}

WORKDIR /janino
COPY . /janino-build
WORKDIR /janino-build

RUN mvn package
RUN mv target/hexlet.janino target/janino

ENV PATH="/${JDK}/bin/:/janino-build/target:${PATH}"

WORKDIR /
