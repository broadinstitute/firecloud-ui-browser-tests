FROM centos:7

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/bin/lein
RUN chmod 755 /usr/bin/lein

RUN echo -e '[google-chrome]\n\
name=google-chrome\n\
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch\n\
enabled=1\n\
gpgcheck=1\n\
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub\n\
' > /etc/yum.repos.d/google-chrome.repo

RUN yum -y install  google-chrome-stable unzip GConf2 java-1.8.0-openjdk && yum clean all

ADD resources /usr/firecloud-ui-browser-tests/resources
ADD scripts /usr/firecloud-ui-browser-tests/scripts
ADD src /usr/firecloud-ui-browser-tests/src
ADD test  /usr/firecloud-ui-browser-tests/test
ADD project.clj /usr/firecloud-ui-browser-tests/
ADD profiles.clj /usr/firecloud-ui-browser-tests/
WORKDIR /usr/firecloud-ui-browser-tests/

#RUN lein clean
#RUN ./scripts/test.sh linux

