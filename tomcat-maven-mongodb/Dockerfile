FROM ubuntu:16.04
MAINTAINER Diego Lirio <diegolirio.dl@gmail.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget 
RUN apt-get install -y curl
RUN apt-get install -y git-core 
RUN apt-get install xz-utils

### Java ###
ENV JAVA_HOME /root/java
WORKDIR $JAVA_HOME
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz
RUN tar -xvf jdk-8u112-linux-x64.tar.gz -C /root/java --strip-components=1
RUN "pwd"
ENV PATH $JAVA_HOME/bin:$PATH

### Node ###
ENV NODE_HOME /root/node
WORKDIR $NODE_HOME
ENV NODE_VERSION 6.10.2
RUN curl -SLO "https://nodejs.org/dist/v6.10.2/node-v6.10.2-linux-x64.tar.xz"
RUN pwd
RUN ls -la
RUN tar -xJf node-v6.10.2-linux-x64.tar.xz -C /usr/local --strip-components=1
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs
RUN npm install -g @angular/cli

### Maven ###
ENV M2_HOME /root/maven
WORKDIR $M2_HOME
RUN "pwd"
RUN curl -fSL "http://ftp.unicamp.br/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz" -o apache-maven-3.1.1-bin.tar.gz
RUN tar -xvf apache-maven-3.1.1-bin.tar.gz -C /root/maven --strip-components=1
RUN rm apache-maven-3.1.1-bin.tar.gz
ENV PATH $M2_HOME/bin:$PATH

### Mongodb ###
ENV MONGO_HOME /root/mongodb
WORKDIR $MONGO_HOME
RUN curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.4.2.tgz
RUN tar xzf mongodb-linux-x86_64-3.4.2.tgz -C ./ --strip-components=1
RUN mkdir -p /data/db && chmod 777 /data/db
RUN rm mongodb-linux-x86_64-3.4.2.tgz
ENV PATH $MONGO_HOME/bin:$PATH

### Tomcat ###
ENV CATALINA_HOME /root/tomcat
WORKDIR $CATALINA_HOME
ENV TOMCAT_TGZ_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-8/v8.5.13/bin/apache-tomcat-8.5.13.tar.gz
RUN wget -O tomcat.tar.gz "$TOMCAT_TGZ_URL"
RUN tar -xvf tomcat.tar.gz -C /root/tomcat --strip-components=1
ENV PATH $CATALINA_HOME/bin:$PATH


