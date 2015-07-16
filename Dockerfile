FROM selenium/standalone-chrome:2.46.0

MAINTAINER Silver Team <silver@broadinstitute.org>

USER root

# Basics
RUN apt-get update && apt-get install -y \
 git \
 curl \
 xvfb \
 wget

RUN mkdir /fcuitest
COPY . /fcuitest/ 

RUN alias ls='ls -al'

ENV LEIN_ROOT true

RUN wget -q -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

# Clean project
WORKDIR /fcuitest
RUN lein clean

# Test Execution
WORKDIR /fcuitest
RUN xvfb-run lein with-profile docker test
