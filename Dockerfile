FROM centos:7

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/bin/lein
RUN chmod 755 /usr/bin/lein

ADD resources /usr/firecloud-ui-browser-tests/resources
ADD scripts /usr/firecloud-ui-browser-tests/scripts
ADD src /usr/firecloud-ui-browser-tests/src
ADD test  /usr/firecloud-ui-browser-tests/test

WORKDIR /usr/firecloud-ui-browser-tests/

RUN lein clean
RUN ./scripts/test.sh linux

